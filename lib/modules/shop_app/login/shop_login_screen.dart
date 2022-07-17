import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/cubit/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_flutter/modules/shop_app/on_boarding/on_boarding.dart';
import 'package:udemy_flutter/modules/shop_app/register/register_shop_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/shared_preferences.dart';

import '../../../shared/network/end_points.dart';

class LoginScreenShop extends StatelessWidget {
  const LoginScreenShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit , ShopLoginStates>(
       listener: (context , state) {

         if(state is ShopLoginSuccessStates){
           if(state.loginModel.status){
             print(state.loginModel.message);
             print(state.loginModel.data?.token);

             CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value) {
               navigateAndFinish(context, ShopLayout());
             });


           }else{

             token = state.loginModel.data?.token;

             print(state.loginModel.message);
             showToast(text: state.loginModel.message!, state: ToastState.ERROR);
           }
         }
       },
       builder: (context , state) {
         return Scaffold(
           appBar: AppBar(),
           body: Container(
               decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/imges/login.png'),
                     fit: BoxFit.cover
                   )
               ),
             child: Center(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Form(
                     key: formKey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'LOGIN',
                           style: Theme.of(context).textTheme.headline4?.copyWith(
                             color: Colors.white,
                           ),
                         ),
                        const  SizedBox(
                           height: 15.0,
                         ),
                         Text(
                           'Login new to browse our hot offers',
                           style: Theme.of(context).textTheme.bodyText1?.copyWith(
                             color: Colors.grey,
                           ),
                         ),
                       const  SizedBox(
                           height: 30.0,
                         ),
                         defaultFormValid(
                           Controller: emailController,
                           onSubmit: (String){
                             if(formKey.currentState!.validate()){
                               ShopLoginCubit.get(context).userLogin(
                                   email: emailController.text,
                                   password: passwordController.text
                               );
                             }
                           },
                           TextInputType: TextInputType.emailAddress,
                           labelText: 'Email Address',
                           validata: (String value){
                             if(value.isEmpty){
                               return 'Please enter the email';
                             }
                           },
                           Prefix: Icons.email_outlined,
                         ),
                        const SizedBox(
                           height: 13.0,
                         ),
                         defaultFormValid(
                           Controller: passwordController,
                           onSubmit: (String){
                             if(formKey.currentState!.validate()){
                               ShopLoginCubit.get(context).userLogin(
                                   email: emailController.text,
                                   password: passwordController.text
                               );
                             }
                           },
                           TextInputType: TextInputType.visiblePassword,
                           labelText: 'Password',
                           validata: (String value){
                             if(value.isEmpty){
                               return 'Please enter the password';
                             }
                           },
                           suffix: ShopLoginCubit.get(context).suffix,
                           isPassword: ShopLoginCubit.get(context).isPassword,
                           suffixOpressed: (){
                             ShopLoginCubit.get(context).changedPasswordVisibility();
                           },


                         ),
                        const SizedBox(
                           height: 25.0,
                         ),
                         ConditionalBuilder(
                           condition: State is! ShopLoginLoadingStates ,
                           builder: (context) =>  defultButton(
                             function: (){
                               if(formKey.currentState!.validate()){
                                 ShopLoginCubit.get(context).userLogin(
                                     email: emailController.text,
                                     password: passwordController.text
                                 );
                               }

                             },
                             text: 'LOGIN',
                             isUpperCase: true,
                           ),
                           fallback: (context) => Center(child: CircularProgressIndicator()),

                         ),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            const Text(
                               'Don\'t have an account?',
                               style: TextStyle(
                                 fontSize: 13.0,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             defaultTextButton(function: (){
                               navigateTo(context, RegisterShopScreen());
                             }, text: 'REGISTER', color: Colors.blue,)
                           ],
                         ),

                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ),
         );
       },

      ),
    );
  }
}
