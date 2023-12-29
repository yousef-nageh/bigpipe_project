import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../core/util/app_style.dart';
import '../../../../core/util/constance.dart';
import '../../data/models/home_favorites_model.dart';
import '../manager/home_product_cubit/home_product_cubit.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({super.key, required this.model});
 final FavoritesDataProduct model;

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    return Container (
      height: h*s3,

      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.test,

       ),

      child: Padding(
        padding:  EdgeInsets.all(h*s01),
        child: Container(
          width: double.infinity,

    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColor.white,
        ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(child:
                  CachedNetworkImage( imageUrl: model.image.toString(),fit: BoxFit.contain,),

                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            model.name.toString()),
                        HeightSizedBox(screenHeight: h, ratio: s01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text("\$${model.price}", style: AppStyle.textStyle15),
                                SizedBox(width: 5,),
                           if(model.discount !=0)
                                Text(model.old_price.toString(),
                                    style: AppStyle.textStyle15.copyWith(
                                        color: AppColor.green,
                                        decoration: TextDecoration.lineThrough)),
                              ],
                            ),
                              Spacer(),
                              CircleAvatar(
                              radius: h * cSize,
                              backgroundColor: AppColor.test,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                style: IconButton.styleFrom(
                                  foregroundColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                onPressed: ()  {
                                  HomeProductCubit.getInstance(context).postChangeFavorites((model.id??0).toInt());

                                },
                                icon: Center(
                                    child: Icon(
                                      HomeProductCubit.getInstance(context).setIcon((model.id??0).toInt()),

                                      color:  HomeProductCubit.getInstance(context).setIconColor((model.id??0).toInt()),

                                      size: h * fSize,
                                    )),
                              ),
                            ),
                          ],
                        ),

                      ],

                    ),
                  ),





                ],
              ),
              if(model.discount !=0)
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: h * 0.010, vertical: h * 0.004),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.yellow),
                  child: Text(
                    "${model.discount}%",
                    style: AppStyle.textStyle14,
                  ),
                ),
              ),
            ],
          ),
      ),

      ),


    );
  }
}
