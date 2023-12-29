import 'package:dartz/dartz.dart';
import 'package:shop_app/app/classes/failure.dart';
import 'package:shop_app/feature/home/data/models/home_banners_model.dart';
import 'package:shop_app/feature/home/data/models/home_categorises_model.dart';
import 'package:shop_app/feature/home/data/models/home_favorites_model.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';

import '../../../search_product/data/models/search_product_model.dart';
import '../models/change_favorites_model.dart';

abstract class HomeRepo{
 Future<Either<Failure,CategorisesModel>> getCategorisesData();
 Future<Either<Failure,BannersModel>> getBannersData();
 Future<Either<Failure,ProductModel>> getProductData();
 Future<Either<Failure,SearchProductModel>> postSearch(String text);
 Future<Either<Failure,ChangeFavoritesModel>> postFavorites(int itemId);
 Future<Either<Failure,FavoritesModel>> getFavoritesData();
}