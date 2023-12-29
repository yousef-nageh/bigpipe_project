import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/home/presentation/manager/home_banners_cubit/home_banners_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_categorises_cubit/home_categorises_cubit.dart';

import '../../../../core/util/app_color.dart';
import '../manager/home_product_cubit/home_product_cubit.dart';

class HomeViewDesign extends StatelessWidget {
  const HomeViewDesign(
      {super.key,
      required this.homeUpperPart,
      required this.homeLowerImageAndText,
      required this.homeLowerList});

  final Widget homeUpperPart;
  final Widget homeLowerList;
  final Widget homeLowerImageAndText;

  Future<void> onRefresh(context) async {
    BlocProvider.of<HomeCategorisesCubit>(context).getCategoriesData();
    BlocProvider.of<HomeBannersCubit>(context).getBannersData();

    BlocProvider.of<HomeProductCubit>(context).getProductData();
  }

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    return RefreshIndicator(
      color: AppColor.green,

      notificationPredicate: (notification){
        return notification.depth == 1;
      },
      onRefresh: () {
        return onRefresh(context);
      },
      child: NestedScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverToBoxAdapter(
            child: homeUpperPart,
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: homeLowerImageAndText,
            ),
          ),
        ],
        body: homeLowerList,
      ),
    );
  }
}
