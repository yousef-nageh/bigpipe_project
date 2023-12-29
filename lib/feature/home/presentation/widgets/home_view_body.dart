import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/core/util/constance.dart';

import 'home_categorises_list.dart';
import 'home_middle_image.dart';
import 'home_product_list.dart';
import 'home_product_row_text.dart';
import 'home_view_body_design.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    return HomeViewDesign(
      homeUpperPart: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Text(
              AppString.popularCategorises,
              style: AppStyle.textStyle20.copyWith(color: AppColor.white),
            ),
          ),
          const HomeCategorisesList(),
          HeightSizedBox(screenHeight: h, ratio: s1)
        ],
      ),
      homeLowerImageAndText: Column(
        children: [
          SizedBox(
            height: h * s1,
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -h * s1, left: 0, right: 0, child: const HomeMiddleImage()),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding,),
            child: HomeProductRowText(),
          ),

        ],
      ),
      homeLowerList: Container(
        color:AppColor.white,



        child:  const HomeProductList(),
      ),
    );
  }
}
