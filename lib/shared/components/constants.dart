//post
// update
// delete

//get

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=us&category=business&apiKey=3a470a8326ca47bb8a8fddb794ef047f

//https://newsapi.org/v2/everything?q=tesla&apiKey=3a470a8326ca47bb8a8fddb794ef047f

import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/shared_preferences.dart';

void signOut(context) {
  CacheHelper.sharedPreferences.remove('token').then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreenShop());
    }
  });
}

void printFullText(String? text) {
  final pattern = RegExp('.{1.800}');
  pattern.allMatches(text!).forEach((match) => print(match.group(0)));
}


