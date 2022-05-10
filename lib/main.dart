import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/layout/Back_Layout.dart';
import 'package:udemy_flutter/layout/Home_Layout.dart';
import 'package:udemy_flutter/modules/bim/Bim_Screen.dart';
import 'package:udemy_flutter/modules/bim_result/Bim_carcorater.dart';
import 'package:udemy_flutter/modules/home/Home_Secreen.dart';
import 'package:udemy_flutter/modules/login/Login_Screen.dart';
import 'package:udemy_flutter/modules/massnger/Massnger_Screen.dart';
import 'package:udemy_flutter/modules/user/User_Screen.dart';
import 'package:udemy_flutter/shared/bloc_observer.dart';

import 'modules/conter/Conter_Secrren.dart';
import 'modules/login/Login_new.dart';

void main() {

  BlocOverrides.runZoned(
        () {
      runApp(MyApp()) ;
    },
    blocObserver: MyBlocObserver(),
  );

  runApp(MyApp());
}

MyApp app = MyApp();
Widget a = MyApp();

// stateless
// stateful

//class MyApp

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : HomeLayout(),
    );

  }

}


// floatingActionButton
// child : Icon(Icons.add)

// Icon 3ady
//icon : Icon(Icons.Done)



