import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/feature/home/presentation/manager/home_banners_cubit/home_banners_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_banners_cubit/home_banners_state.dart';

import '../../../../core/util/constance.dart';
import 'home_waiting_banners.dart';

class HomeMiddleImage extends StatelessWidget {
  const HomeMiddleImage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();

    return BlocBuilder<HomeBannersCubit, HomeBannersStates>(
      builder: (BuildContext context, state) {
        if (state is HomeGetBannersSuccessState) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: state.model.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index, int realIndex) =>
                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: kPadding + 10),
                                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kPadding),
                      border: Border.all(color: AppColor.black, width: 1.5),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(

                              (state.model.data?[index].image).toString(),

                          ),
                          fit: BoxFit.fill)),
                                    ),
                options: CarouselOptions(
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    height: h * s2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    viewportFraction: 1),
              ),
            ],
          );
        } else {
          return const HomeWaitingBanners();
        }
      },
    );
  }
}
