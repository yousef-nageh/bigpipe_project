import 'package:flutter/material.dart';

import '../../../../core/util/constance.dart';
import '../widgets/favorites_item.dart';
import '../widgets/favorites_list.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: const Column(

        children: [
          Expanded(child: FavoritesList())


        ],
      ),
    );
  }
}
