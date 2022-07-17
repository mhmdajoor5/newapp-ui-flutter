import 'package:flutter/material.dart';

class LoginNew extends StatelessWidget {
  var emailAdrees = TextEditingController();
  var adressPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login New',
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(12.0),

          child: Center(
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: emailAdrees,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value){
                      print(value);
                    },
                      onChanged: (String value){
                      print(value);
                      },
                    decoration: InputDecoration(
                      labelText: 'email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                      )
                    ),

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: adressPassword ,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (String value){
                      print(value);
                    },
                    onChanged: (String value){
                      print(value);
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.lock,
                        )
                    ),

                  ),
                  Container(
                    width:double.infinity ,
                    child: MaterialButton(onPressed: (){
                      print(adressPassword.text);
                      print(emailAdrees.text);
                    },
                      height: 40.0,
                      child: Text(
                        'fcs'
                      ),

                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0,),
                      color: Colors.green
                    ),
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
