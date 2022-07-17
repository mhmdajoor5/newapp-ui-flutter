import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit , NewsStates>(
      listener: (context , state){} ,
      builder: (context , state){

        var list = NewCubit.get(context).search;


        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormValid(
                    Controller: searchController,
                    TextInputType: TextInputType.text,
                    onChanged: (value){
                      NewCubit.get(context).getSearch(value);
                    },
                    onTap: (){},
                    onSubmit: (STRING){
                      if(formKey.currentState!.validate());
                    },

                    validata: (String value){
                      if(value.isEmpty)
                      {
                        return 'Search must not empty';
                      }

                    },
                    labelText: 'Search',
                    Prefix: Icons.search,

                  ),
                ),
                Expanded(child: articleBuilder(list, context , isSearch: true)),

              ],

            ),
          ),
        );
      }, 
    );
  }
}
