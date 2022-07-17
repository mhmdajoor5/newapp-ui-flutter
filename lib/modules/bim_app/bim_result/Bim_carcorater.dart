import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BIMResultScreen extends StatelessWidget {

  final int? Result;
  late bool? isMale;
  final int? age;

  BIMResultScreen({
   @required this.Result,
   @required this.isMale,
   @required this.age,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bim ',
          style: TextStyle(
            fontSize: 17.0,
          ),

        ),
       leading: IconButton(
         onPressed: (){
           Navigator.pop(context);
         },
         icon: Icon(
           Icons.arrow_back_ios
         ),
       ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale! ? 'Male' : 'Female' }',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Result : $Result',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age : $age ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
