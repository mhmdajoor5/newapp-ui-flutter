import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udemy_flutter/modules/home/Home_Secreen.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var adressEmail = TextEditingController();
  var adressPassword = TextEditingController();
  var formKey = GlobalKey <FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey ,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style:TextStyle(
                      fontSize: 25.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(

                    height: 15.5,
                  ),
                  defultFormFalid(
                    labelText: 'Email',
                    Controller: adressEmail,
                    TextInputType: TextInputType.text,
                    Prefix: Icons.attach_email,
                      onTap: (){},
                      validata: (value){
                      if(value.isEmpty){
                        return 'Please enter the email';
                      }
                      // return null;
                    }
                  ),
                  SizedBox(
                    height: 12.5,
                  ),
              defultFormFalid(

                  labelText: 'password',
                  Controller: adressPassword,
                  TextInputType: TextInputType.phone,
                  Prefix: Icons.lock,
                  isPassword : isPassword,
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  onTap: (){},
                  suffixOpressed:(){
                    setState(() {
                      isPassword =! isPassword;
                    });
                  },
                validata: (value){
                    if(value.isEmpty)
                      {
                        return 'Please enter the password';
                      }

                  },
              ),
                  SizedBox(
                    height: 15.5,
                  ),
                  defultButton(
                    text: 'Login',
                      isUpperCase: true,
                    width: double.infinity,
                    background: Colors.black,
                    function: (){
                      if(formKey.currentState!.validate()){
                        print(adressEmail.text);
                        print(adressPassword.text);
                      }
                      return null;



                    }
                  ),
                  SizedBox(
                    height: 15.5,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Don\'t have an account?'),
                      TextButton(onPressed: (){},
                        child: Text(
                            'Register Now'
                        ),
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

  }
}
