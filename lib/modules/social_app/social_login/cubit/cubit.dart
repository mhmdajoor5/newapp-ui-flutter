import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/social_login/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit() : super(SocialLoginInitialStates());

  static SocialLoginCubit get(context) => BlocProvider.of(context);


 void userLogin({
  required String email,
   required String password,
})
 {
   emit(SocialLoginLoadingStates());

   FirebaseAuth.instance.signInWithEmailAndPassword(
       email: email,
       password: password).then((value) {
         print(value.user!.email);
         print(value.user!.uid);
         emit(SocialLoginSuccessStates());
   }).catchError((error){
     emit(SocialLoginErrorStates(error.toString()));
   });

 }

 IconData suffix = Icons.visibility_outlined;
 bool isPassword = true;

     void changedPasswordVisibility(){
       isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

      emit(SocialChangedPasswordVisibilityStates());
     }
}