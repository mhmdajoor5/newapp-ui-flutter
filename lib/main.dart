// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:udemy_flutter/layout/todo_app/ToDo_Layout.dart';
import 'package:udemy_flutter/modules/bim/Bim_Screen.dart';
import 'package:udemy_flutter/modules/bim_result/Bim_carcorater.dart';
import 'package:udemy_flutter/modules/home/Home_Secreen.dart';
import 'package:udemy_flutter/modules/login/Login_Screen.dart';
import 'package:udemy_flutter/modules/massnger/Massnger_Screen.dart';
import 'package:udemy_flutter/modules/user/User_Screen.dart';
import 'package:udemy_flutter/shared/bloc_observer.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/local/shared_preferences.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/conter/Conter_Secrren.dart';
import 'modules/login/Login_new.dart';

void main() async{

  BlocOverrides.runZoned(
        () {


    },
    blocObserver: MyBlocObserver(),


  );
  DioHelper.init();
  await CacheHelper.init();

   bool? isDark = CacheHelper.getData(key:'isDark');

  runApp(MyApp(true));
}
// stateless
// stateful

//class MyApp

class MyApp extends StatelessWidget
{

  final bool isDark;

  MyApp(this.isDark);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..changeAppMode(
        formShared: isDark,
      ),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {},
        builder: (context , state){


          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange
              ),
              scaffoldBackgroundColor: Colors.white ,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                ),

              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 100.0,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                actionsIconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 100.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home :  NewApp(),
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



