import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_image.dart';
import 'package:shop_app/core/util/app_style.dart';

class FavoritesIsEmpty extends StatelessWidget {
  const FavoritesIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    double h= context.getHeight();
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppImage.addFav,width: double.infinity,height: h/2,fit: BoxFit.contain),
        Text("Add Favorites",style: AppStyle.textStyle20,)
      ],
    );
  }
}
