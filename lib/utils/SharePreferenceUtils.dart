import 'package:flutter_mall_self/Constant/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreference{
  static String token = "";

  // /// 获取token
  // static Future getToken() async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   if(token.isEmpty){
  //     token = preferences.getString(Strings.TOKEN);
  //   }
  //   return token;
  // }
  // static Future getImageHead() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.get(Strings.HEAD_URL);
  // }
  //
  // static Future getUserName() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.get(Strings.NICK_NAME);
  // }
  //
  // static Future saveToken(String token) async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString(Strings.TOKEN, token);
  // }
  // static Future saveUserName(String userName) async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString(Strings.NICK_NAME, userName);
  // }
  // static Future saveImageHead(String imageHead) async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString(Strings.HEAD_URL, imageHead);
  // }
  static Future getShareData(String key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }
  static Future saveShareData(String key,String value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    Future<bool> isOk = sp.setString(key, value);
    return isOk;
  }
  static Future removeData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}