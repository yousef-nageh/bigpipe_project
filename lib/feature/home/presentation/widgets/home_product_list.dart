import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_state.dart';

import 'home_product_item.dart';
import 'home_waiting_product.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProductCubit cubit=HomeProductCubit.getInstance(context);
    return BlocBuilder<HomeProductCubit,HomeProductStates>(builder: (BuildContext context, state) {
      if(cubit.homeProductCubit !=null){
        return GridView.builder(

          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.59,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {

            return  HomeProductItem(model:cubit.homeProductCubit!.data!.products![index],);
          },
          itemCount: cubit.homeProductCubit?.data?.products?.length??0,
        );
      }else {
        return const HomeWaitingProduct();
      }
    },

    );
  }
}
