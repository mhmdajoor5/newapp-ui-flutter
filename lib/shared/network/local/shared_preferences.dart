import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_flutter/main.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

   static Future<bool?> putData({
    required String key,
    required bool value,
}) async {
   return await sharedPreferences?.setBool(key, value);
  }

   static bool? getData({
  required String key,
})  {
   return sharedPreferences?.getBool(key);
  }
}