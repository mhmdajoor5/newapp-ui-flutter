import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/models/social_app/social_user_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_flutter/modules/shop_app/register/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/social_login/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/social_register/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterInitialStates());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);


 void userRegister({
   required String name,
   required String email,
   required String password,
   required String phone,
})
 {
   emit(SocialRegisterLoadingStates());
   FirebaseAuth.instance.createUserWithEmailAndPassword(
     email: email,
     password: password,).then((value) {
     print(value.user!.email);
     print(value.user!.uid);
     userCreate(
         name: name,
         email: email,
         phone: phone,
         uId: value.user!.uid);
   }).catchError((error){
     emit(SocialRegisterErrorStates(error.toString()));
   });
 }


 void userCreate({
   required String name,
   required String email,
   required String phone,
   required String uId,
}){

   SocialUserModel model = SocialUserModel(
       name: name,
       email: email,
       phone: phone,
       uId: uId
   );

   FirebaseFirestore.instance
       .collection('users')
       .doc(uId)
       .set(model.toMap()).then((value) {
         emit(SocialCreateUserSuccessStates());
   }).catchError((error){
     emit(SocialCreateUserErrorStates(error.toString()));
   });

 }
 IconData suffix = Icons.visibility_outlined;
 bool isPassword = true;

 void changedPasswordVisibility(){
       isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

      emit(SocialRegisterChangedPasswordVisibilityStates());
     }
}