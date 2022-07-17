import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/shared/components/constants.dart';


class NewTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocConsumer<AppCubit , AppStates>(
    //   listener: (context , index){},
    //   builder: (context , index){
    //     var test = AppCubit.get(context).NewTest;
    //     return ListView.separated(
    //         itemBuilder: (context, index) => defultNewTask(test [ index] , context) ,
    //         separatorBuilder: (context, index) => Padding(
    //           padding: const EdgeInsetsDirectional.only(
    //               start: 25.0
    //           ),
    //           child: Container(
    //             width: double.infinity,
    //             height: 1.0,
    //             color: Colors.grey,
    //           ),
    //         ) ,
    //         itemCount: test.length);
    //   },
    // );
  }
}
