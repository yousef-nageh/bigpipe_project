
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/data/repositories/home_repo.dart';

import 'home_banners_state.dart';

class HomeBannersCubit extends Cubit<HomeBannersStates> {
  HomeBannersCubit(this.homeRepo) : super(HomeBannersInitial());
  HomeRepo homeRepo;
  Future<void> getBannersData() async {
    emit(HomeGetBannersWaitingState());
    var result = await homeRepo.getBannersData();
    result.fold(
            (error) => emit(HomeGetBannersErrorState(error.errorMessage)),
            (bannersModel) =>
            emit(HomeGetBannersSuccessState(bannersModel)));
  }
}
