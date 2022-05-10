import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/conter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitiaStates());
  // CounterCubit => كريتت ابوجت من نفسي
  //get => ميثود
  // BlocProvider.of(context); => طريقه كريت الاوبجت من البلوك
  // بددا بعدها بستعيدها داخل ال counter
  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void miuns(){
    counter --;
    emit(CountermiunsStates(counter));
  }
  void pules(){
    counter ++;
    emit(CounterpulesStates(counter));
  }
}