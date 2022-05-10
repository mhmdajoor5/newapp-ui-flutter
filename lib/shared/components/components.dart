import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';

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


