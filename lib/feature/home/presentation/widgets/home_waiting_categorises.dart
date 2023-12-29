import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/app/widget/shimmer_circle_widget.dart';
import 'package:shop_app/app/widget/shimmer_rectangle_widget.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../core/util/constance.dart';

class HomeWaitingCategorises extends StatelessWidget {
  const HomeWaitingCategorises({super.key});

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    return  SizedBox(
      height: h * 0.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        itemBuilder: (BuildContext context, int index) => SizedBox(
          width:  h*s08,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ShimmerCircleWidget(
              radius: h*s04,
            ),
              HeightSizedBox(screenHeight: h, ratio: s01),
              ShimmerRectangleWidget(
               height: h*s01,
             )
            ],
          ),
        ),

        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(
          width: kPadding,
        ),
        itemCount: 5,
      ),
    );
  }
}
