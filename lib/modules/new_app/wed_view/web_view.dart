import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewScreen extends StatelessWidget {


  final String url;

  WebViewScreen(this.url);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(

        backgroundColor: AppCubit.get(context).isDark ? HexColor('333333') : HexColor('#d0d4d5') ,
        initialUrl: url,
      ),


    );
  }
}
