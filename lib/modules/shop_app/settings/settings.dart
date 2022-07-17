import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;

        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is ShopLoadingUpdateUserStates)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Profile',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: defaultColor,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormValid(
                      Controller: nameController,
                      TextInputType: TextInputType.name,
                      labelText: 'name',
                      validata: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the name';
                        }
                      },
                      Prefix: Icons.person,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormValid(
                      Controller: emailController,
                      TextInputType: TextInputType.emailAddress,
                      labelText: 'Email',
                      validata: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the email';
                        }
                      },
                      Prefix: Icons.email,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormValid(
                      Controller: phoneController,
                      TextInputType: TextInputType.phone,
                      labelText: 'Phone',
                      validata: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the phone';
                        }
                      },
                      Prefix: Icons.phone,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defultButton(
                        text: 'Update',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            ShopCubit.get(context).updateUser(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          }
                        }),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defultButton(
                        text: 'Logout',
                        function: () {
                          signOut(context);
                        }),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
