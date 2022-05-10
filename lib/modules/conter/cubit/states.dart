import 'package:udemy_flutter/modules/conter/cubit/cubit.dart';

abstract class CounterStates{}

class CounterInitiaStates extends CounterStates{}

class CountermiunsStates extends CounterStates{
  final int counter;

  CountermiunsStates(this.counter);
}

class CounterpulesStates extends CounterStates{
  final int counter;

  CounterpulesStates(this.counter);
}