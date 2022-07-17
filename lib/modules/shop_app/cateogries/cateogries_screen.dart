import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/models/shop_app/categories_model.dart';
import 'package:udemy_flutter/modules/shop_app/favorites/favorites_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../../shared/components/constants.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return BlocConsumer<ShopCubit , ShopStates> (
    listener: (context , state){},
    builder: (context , state){
      return  ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context , index) => buildCatoItem(ShopCubit.get(context).categoriesModel!.data.data[index])  ,
        separatorBuilder: (context , index) => SizedBox(
          height: 8.0,
        ),
        itemCount: ShopCubit.get(context).categoriesModel!.data.data.length,
      );
    },
  );

  }

  Widget buildCatoItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(model.image),
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 15.0,),
        Text(
          model.name,
          style: TextStyle(
            fontSize: 20.0,
          ) ,
        ),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,))
      ],
    ),
  );
}
