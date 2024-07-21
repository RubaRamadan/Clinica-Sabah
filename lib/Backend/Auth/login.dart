import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';
import '../../Locale_Memory/save_user_info_locally.dart';

Future login({
  required String password,
  required String phone,
}) async {
  final uri = Uri.parse(kLoginUrl);
  var response = await http.post(uri, body: {
    'password': password,
    'phone': phone,
  }). catchError((err) {
    print('100');
    print(err.response);
    return err.response;
  });
  var p = json.decode(response.body);
  print('jjj $p');
  if (p['status'] == '1') {
    await saveUserInfoLocally(
      p['data']['access_token'],
      '${p['data']['id']}',
      p['data']['email'],
      p['data']['name'],
      p['data']['phone'],
      '${p['data']['code']}',
    );
  }
  return p;
}
