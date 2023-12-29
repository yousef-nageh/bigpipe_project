import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/app/classes/api_service.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/app/classes/failure.dart';
import 'package:shop_app/feature/home/data/models/change_favorites_model.dart';
import 'package:shop_app/feature/home/data/models/home_banners_model.dart';
import 'package:shop_app/feature/home/data/models/home_categorises_model.dart';
import 'package:shop_app/feature/home/data/models/home_favorites_model.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';
import 'package:shop_app/feature/home/data/repositories/home_repo.dart';

import '../../../search_product/data/models/search_product_model.dart';

class HomeRepoImpl implements HomeRepo{

 final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, CategorisesModel>> getCategorisesData() async{
    try {
      var response=await apiService.getData(endPoint: "categories",);
      CategorisesModel categorisesModel=CategorisesModel.fromJson(response.data);
      return Right(categorisesModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, BannersModel>> getBannersData()async {
    try {
      var response=await apiService.getData(endPoint: "banners",);
      BannersModel bannersModel=BannersModel.fromJson(response.data);
      return Right(bannersModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductData()async {
    try {
      var response=await apiService.getData(endPoint: "home",token: CacheHelper.token);
      ProductModel productModel=ProductModel.formJson(response.data);
      return Right(productModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, SearchProductModel>> postSearch(String text)async {
    try {
      var response=await apiService.postData(endPoint: "products/search",token: CacheHelper.token,data: {
        'text':text,
      },
        lang: "en"
      );
      SearchProductModel searchProductModel=SearchProductModel.formJson(response.data);
      return Right(searchProductModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }


  }

  @override
  Future<Either<Failure, ChangeFavoritesModel>> postFavorites(int itemId)async {
    try {
      var response=await apiService.postData(endPoint: "favorites",token: CacheHelper.token,data: {
        'product_id':itemId,
      },
          lang: "en"
      );
      ChangeFavoritesModel changeFavoritesModel=ChangeFavoritesModel.fromJson(response.data);
      return Right(changeFavoritesModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }

  }

  @override
  Future<Either<Failure, FavoritesModel>> getFavoritesData() async{
    try {
      var response=await apiService.getData(endPoint: "favorites",token: CacheHelper.token,

      );
      FavoritesModel favoritesModel=FavoritesModel.fromJson(response.data);
      return Right(favoritesModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }



  }




  }

