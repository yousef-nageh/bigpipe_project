import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';

import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/feature/home/data/models/home_categorises_model.dart';

import '../../../../core/util/constance.dart';

class HomeCategorisesItem extends StatelessWidget {
  const HomeCategorisesItem({super.key, required this.model});
 final CategorisesList model;

  @override
  Widget build(BuildContext context) {
    double h=context.getHeight();

    return  SizedBox(
      width:  h*s08,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: h*s04,
            backgroundColor: AppColor.white,
            child:CachedNetworkImage(height: h*s05,width:h*s05 ,fit: BoxFit.fill, imageUrl: model.image.toString(),

            ) ,

          ),
          Text(
            maxLines: 1,
            overflow:TextOverflow.ellipsis ,
            model.name.toString(),style: AppStyle.textStyle14.copyWith(color: AppColor.white),)
        ],
      ),
    );
  }
}
