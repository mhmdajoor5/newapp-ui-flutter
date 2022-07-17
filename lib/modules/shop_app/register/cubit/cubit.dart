import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_flutter/modules/shop_app/register/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialStates());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

   late ShopLoginModel? loginModel;

 void userRegister({
   required String name,
   required String email,
   required String password,
   required String phone,
})
 {
   emit(ShopRegisterLoadingStates());
   DioHelper.postData(
       url: REGISTER,
       data:{
         'name': name,
         'email':email,
         'password':password,
         'phone' : phone,
        }).then((value) {
     print(value.data);
      loginModel = ShopLoginModel.formJson(value.data);
      emit(ShopRegisterSuccessStates(loginModel!));
   }).catchError((error){
     emit(ShopRegisterErrorStates(error.toString()));
   });
 }

 IconData suffix = Icons.visibility_outlined;
 bool isPassword = true;

     void changedPasswordVisibility(){
       isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

      emit(ShopRegisterChangedPasswordVisibilityStates());
     }
}