import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/constance.dart';
import 'package:shop_app/feature/home/presentation/manager/home_categorises_cubit/home_categorises_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_categorises_cubit/home_categorises_state.dart';
import 'package:shop_app/feature/home/presentation/widgets/home_categorises_item.dart';

import 'home_waiting_categorises.dart';

class HomeCategorisesList extends StatelessWidget {
  const HomeCategorisesList({super.key});

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    return BlocBuilder<HomeCategorisesCubit, HomeCategorisesStates>(
      builder: (BuildContext context, state) {
        if (state is HomeGetCategoriesSuccessState) {
          return SizedBox(
            height: h * 0.15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              itemBuilder: (BuildContext context, int index) =>
                  HomeCategorisesItem(
                model: state.model.data!.data![index],
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: kPadding,
              ),
              itemCount: state.model.data?.data?.length ?? 0,
            ),
          );
        }  else {
          return const HomeWaitingCategorises();
        }
      },
    );
  }
}
