import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class NewApp extends StatelessWidget {
  const NewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewCubit()..getBusiness(),
      child: BlocConsumer<NewCubit , NewsStates>(
        listener: (context, state) {},
        builder: (context , state) {

          var cubit = NewCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                  'New App'
              ),
              leading: IconButton(
                onPressed: (){},
                icon:  Icon(
                    Icons.menu_outlined
                ),
                ),
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.search),

                ),
                IconButton(
                  icon:  Icon(Icons.brightness_4_outlined
                  ),
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },

                ),
              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index){
                cubit.changeBottomBar(index);
              },

            ),
          );
        },

      ),
    );
  }
}
