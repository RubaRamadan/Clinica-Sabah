import 'package:shared_preferences/shared_preferences.dart';

saveUserInfoLocally(String accessToken,String id, String email,String name,String phone,String code) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('accessToken', accessToken);
  prefs.setString('id', id);
  prefs.setString('email', email);
  prefs.setString('name', name);
  prefs.setString('phone', phone);
  prefs.setString('code', code);
}

Future<Map> getUserInfoFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String accessToken = prefs.getString('accessToken') ?? '';
  String id = prefs.getString('id') ?? '';
  String email = prefs.getString('email') ?? '';
  String name = prefs.getString('name') ?? '';
  String phone = prefs.getString('phone') ?? '';
  String code = prefs.getString('code') ?? '';
  return {
    'accessToken': accessToken,
    'id':id,
    'email': email,
    'name': name,
    'phone': phone,
    'code': code,
  };
}

Future<String> getAccessTokenFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String accessToken = prefs.getString('accessToken') ?? '';
  return accessToken;
}

Future<String> getCodeFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String code = prefs.getString('code') ?? '';
  return code;
}

Future<String> getEmailFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String email = prefs.getString('email') ?? '';
  return email;
}

Future<String> getNameFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String nike = prefs.getString('name') ?? '';
  return nike;
}

//
// saveUserIdLocally(String id) async{
//   SharedPreferences prefs=await SharedPreferences.getInstance();
//   prefs.setString('id', id);
// }
//
Future<String> getIdFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString('id') ?? '';
  return id;
}

Future<String> getPhoneFromPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String phone = prefs.getString('phone') ?? '';
  return phone;
}
