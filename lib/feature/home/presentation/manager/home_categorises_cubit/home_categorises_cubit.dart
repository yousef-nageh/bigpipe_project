
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/data/repositories/home_repo.dart';

import 'home_categorises_state.dart';

class HomeCategorisesCubit extends Cubit<HomeCategorisesStates> {
  HomeCategorisesCubit(this.homeRepo) : super(HomeCategorisesInitial());
  HomeRepo homeRepo;

  Future<void> getCategoriesData() async {
    emit(HomeGetCategoriesWaitingState());
    var result = await homeRepo.getCategorisesData();
    result.fold(
            (error) => emit(HomeGetCategoriesErrorState(error.errorMessage)),
            (categorisesModel) =>
            emit(HomeGetCategoriesSuccessState(categorisesModel)));
  }
}
