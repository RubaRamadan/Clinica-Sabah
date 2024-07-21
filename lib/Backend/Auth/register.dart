import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';
import '../../Locale_Memory/save_user_info_locally.dart';

Future register(
    {required String name,
      required String email,
      required String password,
      required String phone,
      required String country}) async {
  final uri = Uri.parse(kRegisterUrl);
  var response = await http.post(uri, body: {
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'country': country,
  }). catchError((err) {
  print('100');
  print(err.response);
  return err.response;
  });
  print('p $country');
  var p = json.decode(response.body);
  print('hhh');
  print( '${p['data']['id']}');
  print(p);
  if (p['status'] == '1') {
    await saveUserInfoLocally(
      p['data']['access_token'],
      '${p['data']['id']}',
      p['data']['email'],
      p['data']['name'],
      p['data']['phone'],
      '${p['data']['code']}',
    );
    // return p['data'];
  }
  // else {
  //   return [];
  // }
  print(p);
  return p;
}
