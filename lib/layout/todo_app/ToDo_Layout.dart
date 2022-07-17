// ignore_for_file: invalid_required_positional_param

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../shared/components/constants.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget
{

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var textController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer< AppCubit , AppStates >(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertToDatabaseStates ){

              Navigator.pop(context);
          }
        },
        builder: ( BuildContext context , state){
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Center(
                child: Text(
                  cubit.Title[cubit.currentIndex],
                ),
              ),
            ),
            body:  ConditionalBuilder(
              condition: true ,
              builder: (context) => cubit.Screen[cubit.currentIndex] ,
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            )  ,
            floatingActionButton: FloatingActionButton(
                onPressed: (){
                  if(cubit.isBottomSheet) {
                    if(formKey.currentState!.validate()){
                      cubit.insertToDatabase(
                          title: textController.text,
                          time: timeController.text,
                          date: dateController.text
                      );

                    }
                  }else{

                    scaffoldKey.currentState?.showBottomSheet(
                          (context) => Container(
                        color: Colors.black26,
                        padding:EdgeInsets.all(20.0) ,
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:  [
                              defaultFormValid(
                                onTap: (){

                                },
                                Controller: textController ,
                                TextInputType: TextInputType.text,
                                labelText: 'Input Text',
                                validata: (value){
                                  if(value.isEmpty){
                                    return 'Please enter the Text';

                                  }
                                  return null;
                                },
                                Prefix: Icons.text_fields,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                      .then((value) {
                                    timeController.text = value!.format(context);
                                  });

                                },
                                child: IgnorePointer(
                                  child: defaultFormValid(
                                    Controller: timeController ,
                                    TextInputType: TextInputType.datetime,
                                    labelText: 'time Text',
                                    validata: (value){
                                      if(value.isEmpty){
                                        return 'Please enter the time';

                                      }
                                    },
                                    Prefix: Icons.watch_later,
                                    onTap: (){
                                      showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text = value!.format(context);
                                      });


                                    },

                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 8.0,
                              ),
                              InkWell(
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-08-09'),
                                  ).then((value) {
                                    dateController.text = DateFormat.yMMMd().format(value!);
                                  });
                                },
                                child: IgnorePointer(
                                  child: defaultFormValid(
                                    Controller:  dateController,
                                    TextInputType: TextInputType.phone,
                                    labelText: 'date Text',
                                    validata: (value){
                                      if(value.isEmpty){
                                        return 'Please enter the Data';
                                      }
                                    },
                                    Prefix: Icons.calendar_today_outlined,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ).closed.then((value) {
                    cubit.changeBottomSheetShown(
                        isShow: false ,
                        icon: Icons.edit
                    );
                    });
                    cubit.changeBottomSheetShown(
                        isShow: true,
                        icon: Icons.add
                    );
                  }
                },
                child: Icon(
                    cubit.fadIcon
                )
            ),
            bottomNavigationBar:  BottomNavigationBar (
                type: BottomNavigationBarType.fixed,
                currentIndex: AppCubit.get(context).currentIndex,
                onTap: (index){
                  cubit.changeIndex(index);
                },
                items: const  [
                  BottomNavigationBarItem(
                       icon:  Icon(
                        Icons.desktop_mac_sharp
                    ),
                    label: 'Task',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.done,
                    ),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                        Icons.archive
                    ),
                    label: 'Archived',
                  ),
                ]),
          );
        },
      ),
    );
  }
  Future<String> getName() async {
    return 'Todo App';
  }


}