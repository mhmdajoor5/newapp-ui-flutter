import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/models/shop_app/favorites_Model.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../../shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state){
        return  ConditionalBuilder(
          condition: state is! ShopLoadingFavoritesStates,
          builder:(context) => ListView.separated(
            itemBuilder: (context , index) => buildProductsItem(ShopCubit.get(context).favoritesModel!.data!.data![index].product , context)  ,
            separatorBuilder: (context , index) => SizedBox(
              height:0.0,
            ) ,
            itemCount:ShopCubit.get(context).favoritesModel!.data!.data!.length ,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}
