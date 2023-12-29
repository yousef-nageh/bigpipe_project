
import '../../../data/models/home_categorises_model.dart';

abstract class HomeCategorisesStates {}

class HomeCategorisesInitial extends HomeCategorisesStates {}
class HomeGetCategoriesWaitingState extends HomeCategorisesStates {}
class HomeGetCategoriesSuccessState extends HomeCategorisesStates {
  final CategorisesModel model;

  HomeGetCategoriesSuccessState(this.model);
}
class HomeGetCategoriesErrorState extends HomeCategorisesStates {
  final String error;

  HomeGetCategoriesErrorState(this.error);
}