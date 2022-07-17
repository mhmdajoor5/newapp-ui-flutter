// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/layout/todo_app/ToDo_Layout.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/modules/shop_app/on_boarding/on_boarding.dart';
import 'package:udemy_flutter/modules/social_app/social_login/social_login.dart';
import 'package:udemy_flutter/shared/bloc_observer.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/local/shared_preferences.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';
import 'package:udemy_flutter/shared/styles/Themes.dart';
import 'layout/news_app/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  DioHelper.init();
  await CacheHelper.init();
  bool? isDark =CacheHelper.getData(key: 'isDark');

  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  token = CacheHelper.getData(key: 'token');

  if(OnBoardingScreen() != null){
    if(token != null ) widget = ShopLayout();
    else widget = LoginScreenShop();
  }else {
   widget = OnBoardingScreen();
  }

  BlocOverrides.runZoned(() {
    runApp(MyApp(
      isDark: isDark,
      startWidget: widget ,
    ));
  },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  MyApp({this.isDark, this.startWidget});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (create)=> NewCubit()..getBusiness()..getSciences()..getSport()),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(
          formShared: isDark,
        ),),
        BlocProvider(create: (BuildContext context) => ShopCubit()..getHomeModel()..getCategories()..getFavorites()..getUserData(), ),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {},
        builder: (context , state){


          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home : startWidget,
          );
        },
      ),
    );

  }

}


















































// floatingActionButton
// child : Icon(Icons.add)

// Icon 3ady
//icon : Icon(Icons.Done)



