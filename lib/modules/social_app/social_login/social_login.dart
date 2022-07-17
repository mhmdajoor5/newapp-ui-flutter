import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/social_app/social_login/cubit/cubit.dart';
import 'package:udemy_flutter/modules/social_app/social_login/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/social_register/socail_register.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../shop_app/login/cubit/cubit.dart';
import '../../shop_app/login/cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorStates) {
            showToast(text: state.error, state: ToastState.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
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
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Login new to communicate with friends',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormValid(
                          Controller: emailController,
                          onSubmit: (String) {
                            if (formKey.currentState!.validate()) {
                              SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          TextInputType: TextInputType.emailAddress,
                          labelText: 'Email Address',
                          validata: (String value) {
                            if (value.isEmpty) {
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
                          onSubmit: (String) {
                            if (formKey.currentState!.validate()) {
                              SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          TextInputType: TextInputType.visiblePassword,
                          labelText: 'Password',
                          validata: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter the password';
                            }
                          },
                          suffix: SocialLoginCubit.get(context).suffix,
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          suffixOpressed: () {
                            SocialLoginCubit.get(context)
                                .changedPasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        ConditionalBuilder(
                          condition: State is! SocialLoginLoadingStates,
                          builder: (context) => defultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            text: 'LOGIN',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
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
                            defaultTextButton(
                              function: () {
                                navigateTo(context, RegisterSocialScreen());
                              },
                              text: 'REGISTER',
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ],
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
