import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';


class doneSccreen extends StatelessWidget {
  const doneSccreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , index){},
      builder: (context , index){
        var test = AppCubit.get(context).doneTest;
        return ConditionalBuilder(
          condition: test.length > 0 ,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => defultNewTask(test[ index] , context) ,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 25.0
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey,
                ),
              ) ,
              itemCount: test.length),
          fallback: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.menu_outlined,
                  size: 100.0,
                  color: Colors.grey,
                ),

                Text(
                  'No Task Yet , Please Add Some Tasks ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ) ,

        );
      },
    );
  }
}
