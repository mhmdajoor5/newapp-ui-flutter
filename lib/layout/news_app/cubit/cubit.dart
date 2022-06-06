import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import '../../../modules/newapp/business/business_screen.dart';
import '../../../modules/newapp/sciences/sciences_screen.dart';
import '../../../modules/newapp/settings/settings.dart';
import '../../../modules/newapp/sport/sport_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewCubit extends Cubit<NewsStates>
{
  NewCubit() : super (NewInitialStates());

  static NewCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon:  Icon( Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sport'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];


  List<Widget> screen = const [
    BusinessScreen(),
    SciencesScreen(),
    SportScreen(),
    SettingsScreen(),
  ];


  void changeBottomBar (int index){
    if(index == 1)
      getSciences();
    if(index == 2)
      getSport();
    currentIndex = index;
    emit(NewBottomNavBarStates());
  }

  List <dynamic> business = [];

  void getBusiness (){
    emit(NewGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
            'category':'business',
            'apiKey':'3a470a8326ca47bb8a8fddb794ef047f',
    },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewGetBusinessErrorState(error.toString()));
    });
  }

  List <dynamic> sciences = [];

  void getSciences (){
    emit(NewGetSciencesLoadingState());

    if(sciences.length == 0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'science',
          'apiKey':'3a470a8326ca47bb8a8fddb794ef047f',
        },
      ).then((value) {
        sciences = value.data['articles'];
        print(sciences[0]['title']);
        emit(NewGetSciencesSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewGetSciencesErrorState(error.toString()));
      });
    }else {
      emit(NewGetSciencesSuccessState());

    }

  }

  List <dynamic> sport = [];

  void getSport (){
    emit(NewGetSportLoadingState());

     if(sport.length==0){
       DioHelper.getData(
         url: 'v2/top-headlines',
         query:
         {
           'country':'us',
           'category':'sports',
           'apiKey':'3a470a8326ca47bb8a8fddb794ef047f',
         },
       ).then((value) {
         sport = value.data['articles'];
         print(sport[0]['title']);

         emit(NewGetSportSuccessState());
       }).catchError((error){
         print(error.toString());
         emit(NewGetSportErrorState(error.toString()));
       });
     }else {
       emit(NewGetSportSuccessState());
     }

  }


}
