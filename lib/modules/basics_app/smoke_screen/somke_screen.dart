
import 'package:flutter/material.dart';

class somkeScreen extends StatelessWidget {
  const somkeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Smoke New',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
