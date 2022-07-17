import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/shop_app/register/cubit/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/register/cubit/states.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/shared_preferences.dart';
import '../login/shop_login_screen.dart';

class RegisterShopScreen extends StatelessWidget {
  const RegisterShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit , ShopRegisterStates>(
        listener: (context ,state) {
          if(state is ShopRegisterSuccessStates){
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
        builder: (context ,state) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/imges/register.png'),
                      fit: BoxFit.fitWidth,
                    ),
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
                            'Register',
                            style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const  SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Register new to browse our hot offers',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          const  SizedBox(
                            height: 30.0,
                          ),
                          defaultFormValid(
                            Controller: nameController,
                            onSubmit: (String){
                              if(formKey.currentState!.validate()){
                              }
                            },
                            TextInputType: TextInputType.name,
                            labelText: 'Name',
                            validata: (String value){
                              if(value.isEmpty){
                                ShopRegisterCubit.get(context).userRegister(

                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,

                                );
                                return 'Please enter the name';
                              }
                            },
                            Prefix: Icons.person,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          defaultFormValid(
                            Controller: emailController,
                            onSubmit: (String){
                              if(formKey.currentState!.validate()){
                              }
                            },
                            TextInputType: TextInputType.emailAddress,
                            labelText: 'Email Address',
                            validata: (String value){
                              if(value.isEmpty){
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
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
                              }
                            },
                            TextInputType: TextInputType.text,
                            labelText: 'password',
                            validata: (String value){
                              if(value.isEmpty){
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                                return 'Please enter the password';
                              }
                            },
                            Prefix: Icons.lock,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          defaultFormValid(
                            Controller: phoneController,
                            onSubmit: (String){
                              if(formKey.currentState!.validate()){
                              }
                            },
                            TextInputType: TextInputType.emailAddress,
                            labelText: 'phone',
                            validata: (String value){
                              if(value.isEmpty){
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                                return 'Please enter the phone';
                              }
                            },
                            Prefix: Icons.phone,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          ConditionalBuilder(
                            condition: State is! ShopRegisterLoadingStates ,
                            builder: (context) =>  defultButton(
                              function: (){
                                if(formKey.currentState!.validate()){
                                  ShopRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }

                              },
                              text: 'Register',
                              isUpperCase: true,
                            ),
                            fallback: (context) => const Center(child: CircularProgressIndicator()),

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
