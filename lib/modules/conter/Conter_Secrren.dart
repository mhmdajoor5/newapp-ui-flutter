import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/conter/cubit/cubit.dart';
import 'package:udemy_flutter/modules/conter/cubit/states.dart';

 class conterScreen extends StatelessWidget
 {

   @override
   Widget build(BuildContext context) {
     return BlocProvider(
       create: (BuildContext context) => CounterCubit(),
       child: BlocConsumer<CounterCubit , CounterStates>(
         listener: ( BuildContext context , CounterStates state){
           if (state is CountermiunsStates){
            // print('Miuns ${state.counter}');
           }
           if (state is CounterpulesStates){
          //   print('Pules ${state.counter} ');
           }
         },
         builder: ( BuildContext context , CounterStates stats) {
           return Scaffold(
             appBar: AppBar(
               title: Text(
                 'conter',
                 style: TextStyle(
                   fontSize: 25.0,
                 ),
               ),
             ),
             body: Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton(
                     onPressed:(){
                       CounterCubit.get(context).miuns();
                     } ,
                     child: Text(
                       'miuns',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 25.0,
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 15.0,
                     ),
                     child: Text(
                       '${CounterCubit.get(context).counter}',
                       style: TextStyle(
                         fontSize:50.0,
                         fontWeight: FontWeight.w900,
                         color: Colors.green,
                       ),
                     ),
                   ),
                   TextButton(
                     onPressed:(){
                       CounterCubit.get(context).pules();

                     } ,
                     child: Text(
                       'BOUNS',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 25.0,
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           );
         },
       ),
     );
   }
}
