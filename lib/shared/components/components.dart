import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';


Widget defultButton({
  double? width = double.infinity,
  Color? background = Colors.blue,
  @required String? text,
  bool  isUpperCase = true,
  @required Function()? function,

}) =>  Container (
  width: width,
  child: MaterialButton(
    onPressed:function,
    height: 40.0,
    child:  Text  (
      isUpperCase ? text!.toUpperCase() : text!,
      style: const TextStyle  (
          fontSize: 22.5,
          color: Colors.white
      ),
    ),

  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0,),
    color: background,
  ),
);

Widget defultFormFalid({
  @required TextEditingController? Controller,
  @required TextInputType ,
  @required labelText,
  @required bool isPassword = false,
  Function()? onSubmit,
  @required Function()? onTap,
  Function()? onChanged,
  required Function(String) validata,
  @required IconData? Prefix,
  IconData? suffix,
  Function()? suffixOpressed,

}) => TextFormField(

  controller:Controller,
  keyboardType:TextInputType,
  obscureText: isPassword,
  onFieldSubmitted:(s){
    onSubmit!();
  },

  onChanged: (s){
    if(onChanged != null){
      onChanged();
    }
  },
  validator: (s){
    print(s);
    return validata(s!);
  },

  decoration: InputDecoration(
    labelText: labelText,
    border: const OutlineInputBorder(),
    suffixIcon : suffix != null ?
    IconButton(
        onPressed: suffixOpressed ,
        icon: Icon(suffix)) : null,
    prefixIcon:  Icon(
      Prefix,
    ),
  ),
);

Widget defultNewTask(Map model , context) => Dismissible(
  key: Key (model['id'].toString()),
  child:Padding(

    padding: const EdgeInsets.all(12.0),

    child: Row(

      children: [

        CircleAvatar(

          backgroundColor: Colors.black38,

          radius: 40.0,

          child: Text(

            '${model ['time']}',

            style: const TextStyle(

              color: Colors.black,

              fontWeight: FontWeight.w500,

            ),





          ),

        ),

        const SizedBox(

          width: 15.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                '${model ['title']}',

                style: const TextStyle(

                  color: Colors.black,

                  fontSize: 16.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

             const  SizedBox(

                height: 8.0,

              ),

              Text(

                '${model ['date']}',

                style: const TextStyle(

                  color: Colors.grey,

                  fontSize: 16.0,



                ),

              ),

            ],

          ),

        ),

        const SizedBox(

          width: 15.0,

        ),

        IconButton(

            onPressed: (){

              AppCubit.get(context).upDateBase(status: 'done', id: model['id']);

            },

            icon: const Icon(Icons.check_box),

          color: Colors.green,

        ),

        IconButton(

            onPressed: (){

              AppCubit.get(context).upDateBase(status: 'archived', id: model['id']);

            },

            icon: const Icon(Icons.archive),

          color: Colors.black38,

        ),



      ],

    ),

  ),
  onDismissed: (direction) {
     AppCubit.get(context).deleteDateBase(id: model['id']);
  },

);


Widget buildArticleItem(article , context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children:[
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:  DecorationImage(
            image: NetworkImage ('${article['urlToImage']}'),
            fit: BoxFit.cover,

          ),

        ) ,
      ),
      const  SizedBox (
        width: 20.0,
      ),
      Expanded(
        child:  Container(
          height: 120.0,
          child: Column(

            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Expanded(
                child: Text(
                   '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),

    ],
  ),
) ;

Widget articleBuilder (list,context) => ConditionalBuilder(

  condition: list.length > 0,
  builder: (context ) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(list[index],context ) ,
      separatorBuilder: (context , index) => SizedBox(height: 1.0,
      )  ,
      itemCount: 10
  ) ,
  fallback: (context) => Center(child: CircularProgressIndicator()) ,
);


