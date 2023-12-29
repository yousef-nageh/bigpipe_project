import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/my_text_button.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../../../core/util/app_string.dart';

class HomeProductRowText extends StatelessWidget {
  const HomeProductRowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(AppString.popularProducts,style: AppStyle.textStyle20,),
        MyTextButton(onPressed: (){}, text: AppString.viewAll),
    ],);
  }
}
