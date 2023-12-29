
import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/my_icon_button.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';
import 'package:shop_app/core/util/app_string.dart';

import '../../../../core/util/icon_broken.dart';


class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(AppString.goodDay),
        MyIconButton(onPressed: (){
          context.navigateTo(pageName: AppRoutes.searchViewRoute);
        }, iconData: IconBroken.Search),
      ],
    );
  }
}
