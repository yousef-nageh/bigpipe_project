

import '../../../data/models/home_product_model.dart';

abstract class HomeProductStates {}

class HomeProductInitial extends HomeProductStates {}

class HomeGetProductWaitingState extends HomeProductStates {}

class HomeGetProductSuccessState extends HomeProductStates {
  final ProductModel model;

  HomeGetProductSuccessState(this.model);
}

class HomeGetProductErrorState extends HomeProductStates {
  final String error;

  HomeGetProductErrorState(this.error);
}

class HomeChangeFavoritesWaitingState extends HomeProductStates {}

class HomeChangeFavoritesSuccessState extends HomeProductStates {}

class HomeChangeFavoritesErrorState extends HomeProductStates {}
class GetFavoritesWaitingState extends HomeProductStates {}
class GetFavoritesSuccessState extends HomeProductStates {}
class GetFavoritesErrorState extends HomeProductStates {}

