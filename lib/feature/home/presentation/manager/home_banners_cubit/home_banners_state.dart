
import '../../../data/models/home_banners_model.dart';

abstract class HomeBannersStates {}

class HomeBannersInitial extends HomeBannersStates {}
class HomeGetBannersWaitingState extends HomeBannersStates {}
class HomeGetBannersSuccessState extends HomeBannersStates {
  final BannersModel model;

  HomeGetBannersSuccessState(this.model);
}
class HomeGetBannersErrorState extends HomeBannersStates {
  final String error;

  HomeGetBannersErrorState(this.error);
}
