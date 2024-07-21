import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';
import '../../Locale_Memory/save_user_info_locally.dart';


Future updateUser(
    {
      required String id,
      required String status,
    }) async {
  String token = await getAccessTokenFromPref();
  final uri = Uri.parse(kUpdateUserUrl);
  var response = await http.post(uri,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
      body: {
    'id': id,
    'status': status,
  }). catchError((err) {
    print('100');
    print(err.response);
    return err.response;
  });
  var p = json.decode(response.body);
  return p;
}
