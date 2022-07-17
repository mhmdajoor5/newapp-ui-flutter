import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit/cubit.dart';
import '../../../layout/news_app/cubit/states.dart';
import '../../../shared/components/components.dart';

 class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return BlocConsumer<NewCubit , NewsStates>(
      listener: (context, state) {} ,
      builder: (context, state) {

         var list = NewCubit.get(context).sport;

        return articleBuilder (list,context);
      } ,
    );
  }
}
