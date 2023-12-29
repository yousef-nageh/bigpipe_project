import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_state.dart';

import '../widgets/app_bar_title.dart';
import '../widgets/home_bottom_nave_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    HomeCubit cubit = HomeCubit.getInstance(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor: cubit.setScaffoldColor(),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: cubit.setAppBarColor(),
          title: const AppBarTitle(),
        ),
        bottomNavigationBar:const HomeBottomNaveBar(),
        body: cubit.screens[cubit.currentIndex],
      ),
    );
  }

}
