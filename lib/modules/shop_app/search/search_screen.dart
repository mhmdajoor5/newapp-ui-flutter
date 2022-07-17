import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/shop_app/search/cubit/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/search/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit , SearchStates>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormValid(
                    Controller: searchController,
                    TextInputType: TextInputType.text,
                    labelText: 'Search',
                    onSubmit: (String text){
                      SearchCubit.get(context).search(text);
                    },
                    validata: ( String value){
                      if(value.isEmpty){
                        return 'Please enter the Search';
                      }
                    },
                    Prefix: Icons.search,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  if(state is SearchLoadingStates)
                  LinearProgressIndicator(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  if(state is SearchSuccessStates)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context , index) => buildProductsItem(SearchCubit.get(context).model!.data!.data![index] ,context , isOldPrice: false)  ,
                      separatorBuilder: (context , index) => SizedBox(
                        height:0.0,
                      ) ,
                      itemCount:SearchCubit.get(context).model!.data!.data!.length ,
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
