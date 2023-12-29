import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/core/util/constance.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({super.key, required this.model});

  final ProductListData model;

  @override
  Widget build(BuildContext context) {
    double h = context.getHeight();
    return InkWell(
      onTap: () {
        context.navigateTo(
            pageName: AppRoutes.productDetailsRoute,
            arguments: model);
      },
      child: Container(
        height: h * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.test,
          borderRadius: BorderRadius.circular(kPadding),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: AppColor.black,
              spreadRadius: 0.2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
                child: Stack(
                  children: [
                    Hero(
                      tag: model.id.toString(),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(kPadding),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                               model.image.toString(),
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    if(model.discount!=0)
                    Positioned(
                      top: 10,
                      left: 10,
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
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: h * cSize,
                        backgroundColor: AppColor.test,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                          ),
                          onPressed: () {
                            HomeProductCubit.getInstance(context).postChangeFavorites((model.id??0).toInt());

                          },
                          icon: Center(
                              child: Icon(
                            HomeProductCubit.getInstance(context).setIcon((model.id??0).toInt()),
                            color:    HomeProductCubit.getInstance(context).setIconColor((model.id??0).toInt()),
                            size: h * fSize,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          model.name.toString(),
                          style: AppStyle.textStyle15.copyWith(height: 2),
                        ),
                        if(model.discount!=0)
                        Text(model.old_price.toString(),
                            style: AppStyle.textStyle15.copyWith(
                                color: AppColor.grey,
                                decoration: TextDecoration.lineThrough)),
                        if(model.discount==0)
                        HeightSizedBox(screenHeight: h, ratio: s02),
                        Text("\$${model.price}", style: AppStyle.textStyle20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: h * s05,
                    height: h * s05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Text(
                      "+",
                      style: AppStyle.textStyle14,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  List<String>?getList(){
    model.images?.add(model.image.toString());
    List<String>? strlist = model.images?.cast<String>();
    return strlist;
  }
}
