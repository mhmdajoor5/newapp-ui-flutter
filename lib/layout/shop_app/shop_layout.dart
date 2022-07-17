import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/modules/shop_app/on_boarding/on_boarding.dart';
import 'package:udemy_flutter/modules/shop_app/register/register_shop_screen.dart';
import 'package:udemy_flutter/modules/shop_app/settings/settings.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/shared_preferences.dart';

import '../../modules/shop_app/search/search_screen.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


        return BlocConsumer<ShopCubit ,ShopStates>(
          listener: (context, state) {},
          builder: (context, state) {

            var cubit = ShopCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                leading: IconButton(onPressed: (){
                  navigateTo(context, OnBoardingScreen());
                }, icon: Icon(Icons.menu),iconSize: 25.0,),
                title:  Text('Salla',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  IconButton(onPressed: (){
                    navigateTo(context,  SearchScreen());
                  }, icon: Icon(Icons.search))
                ],
              ),
              body: cubit.bottomScreen[cubit.currentIndex] ,
              bottomNavigationBar: ConvexAppBar(
                style: TabStyle.react,
                onTap: (index){
                  cubit.changeHome(index);
                },
                items:  [
                  TabItem(icon: Icon(Icons.home),),
                  TabItem(icon: Icon(Icons.apps),),
                  TabItem(icon: Icon(Icons.favorite),),
                  TabItem(icon: Icon(Icons.settings),),
                ],
                initialActiveIndex: 1,
              )
            );
          },
        );

  }
}
