import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_state.dart';

import '../../../../core/util/constance.dart';
import '../manager/home_cubit/home_cubit.dart';

class HomeBottomNaveBar extends StatelessWidget {
  const HomeBottomNaveBar({super.key});

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    HomeCubit cubit = HomeCubit.getInstance(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) => BottomNavigationBar(
        onTap: cubit.setCurrentIndex,
        currentIndex: cubit.currentIndex,
        items: List.generate(
            3,
            (index) => BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: h * 0.020, vertical: h * 0.002),
                    decoration: BoxDecoration(
                        color: cubit.setBottomNavigationBarColor(index),
                        borderRadius: BorderRadius.circular(kPadding)),
                    child: Icon(cubit.bottomNavigationBarIcons[index],
                        size: h * 0.035)),
                label: cubit.bottomNavigationBarLabels[index])),
      ),
    );
  }
}
