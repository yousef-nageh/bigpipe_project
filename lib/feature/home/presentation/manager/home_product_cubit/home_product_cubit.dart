import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';

import '../../../data/models/home_favorites_model.dart';
import '../../../data/repositories/home_repo.dart';
import 'home_product_state.dart';

class HomeProductCubit extends Cubit<HomeProductStates> {
  HomeProductCubit(this.homeRepo) : super(HomeProductInitial());
  HomeRepo homeRepo;
  FavoritesModel? favoritesData;

  static HomeProductCubit getInstance(context) => BlocProvider.of(context);

  IconData setIcon(int id) {
    if (favorites[id] == true) {
      return Icons.favorite;
    }

    return Icons.favorite_border;

  }

  Color setIconColor(int id) {
    if (favorites[id] == true) {
      return AppColor.red;
    }

    return AppColor.black;
  }

  Map<int?, bool?> favorites = {};

  ProductModel? homeProductCubit;

  Future<void> getProductData() async {
    emit(HomeGetProductWaitingState());
    var result = await homeRepo.getProductData();
    result.fold((error) => emit(HomeGetProductErrorState(error.errorMessage)),
        (productModel) {
      homeProductCubit = productModel;

      emit(HomeGetProductSuccessState(productModel));
      productModel.data?.products?.forEach((element) {
        favorites.addAll({
          element.id: element.in_favorites,
        });
      });
    });
  }

  Future<void> postChangeFavorites(int itemId) async {
    favorites[itemId] = !(favorites[itemId] ?? false);
    emit(HomeChangeFavoritesWaitingState());
    var result = await homeRepo.postFavorites(itemId);
    result.fold((error) => emit(HomeChangeFavoritesErrorState()),
        (changeFavoritesModel) {
      getFavoriteData();
          emit(HomeChangeFavoritesSuccessState());
        });
  }

  Future<void> getFavoriteData() async {
    emit(GetFavoritesWaitingState());
    var result = await homeRepo.getFavoritesData();
    result.fold((error) => emit(GetFavoritesErrorState()), (favoritesModel) {
      favoritesData = favoritesModel;
      emit(GetFavoritesSuccessState());
    });
  }
}
