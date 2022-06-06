import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:udemy_flutter/shared/network/local/shared_preferences.dart';
import '../../../shared/cubit/states.dart';
import '../../modules/todoapp/archived_Screen/archived_new.dart';
import '../../modules/todoapp/done_Screen/done_new.dart';
import '../../modules/todoapp/task_screen/task_screen.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super (AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> Title = [
    "New App",
    "Done App",
    "Archived App",
  ];

  List<Widget> Screen = [
    const taskScreen(),
    const doneSccreen(),
    const NewArchived(),

  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarStates());
  }
  late Database database;
  List<Map> newTest = [];
  List<Map> doneTest = [];
  List<Map> NewAArchived = [];


  createDatabase(){
    openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database , version){
          print('Create DataBase');
          database.execute
            ('CREATE TABLE test (id INTEGER PRIMARY KEY, time TEXT, title TEXT, date TEXT , status TEXT)').
          then((value){
            print ('Create Table ');
          }).catchError((onError){
            print('Some Error Create DataBase ${onError.toString()}');
          });
        },
        onOpen: (database){
          getFormDatabase(database);
          print('Open DataBase');
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseStates());
    });
  }

  insertToDatabase (
      {
        required String title,
        required String time,
        required String date,
      }
      ) async{
    await database.transaction((txn ) async {
      txn.rawInsert  ('INSERT INTO test (time,title,date,status) VALUES("$time ","$title","$date","new")')

          .then((value){
        print(' $value insert successfully');
        emit(AppInsertToDatabaseStates());

        getFormDatabase(database);


      })

          .catchError((onError){
        print('Some Error insert database ${onError.toString()}');

      });

      return null;
    });

  }

  void getFormDatabase (database) {

    newTest = [];
    doneTest = [];
    NewAArchived = [];

         emit(AppGetFormDatabaseStates());

     database.rawQuery('SELECT * FROM test').then((value) {
      value.forEach((element) {
        if(element['status'] == 'new') {
          newTest.add(element);
        }
        else if(element['status'] == 'done') {
          doneTest.add(element);
        }
         else {
          NewAArchived.add(element);
        }
      });
      emit(AppGetFormDatabaseStates());

    });

  }

  void upDateBase({
    required String status,
    required int id ,
}) async {
     database.rawUpdate(
        'UPDATE test SET status = ? WHERE id = ?',
        ['$status', id,]).then((value) {
          getFormDatabase(database);
       emit(AppUpDatabaseStates());
     });


  }

  void deleteDateBase({
    required int id ,
  }) async {
    database.rawDelete('DELETE FROM test WHERE id = ?', [id]).then((value) {
      getFormDatabase(database);
      emit(AppDeleteDatabaseStates());
    });


  }



  IconData fadIcon = Icons.edit;
  bool isBottomSheet = false;

  void changeBottomSheetShown({
    required bool isShow,
    required IconData icon,
  })
  {
    isBottomSheet = isShow;
    fadIcon = icon;

    emit(AppChangeBottomSheetShown());
  }

  bool isDark = false;

  void changeAppMode({bool? formShared}){

   if(formShared != null) {
     isDark = formShared;
     emit(NewChangeAppModeState());
   }
   else{
     isDark = !isDark;

     CacheHelper.putData(key: 'isDark' , value: isDark).then((value) {
       emit(NewChangeAppModeState());
     });
   }

  }


}