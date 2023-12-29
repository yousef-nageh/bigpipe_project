import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/shimmer_rectangle_widget.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../core/util/constance.dart';

class HomeWaitingBanners extends StatelessWidget {
  const HomeWaitingBanners({super.key});

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    double w = context.getWidth();
    return  CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index, int realIndex) =>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding + 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(kPadding),
                child:const ShimmerRectangleWidget()),
          ),
      options: CarouselOptions(
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          height: h * s2,


          viewportFraction: 1),
    );
  }
}
