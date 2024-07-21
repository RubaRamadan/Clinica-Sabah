import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';
import '../../Locale_Memory/save_user_info_locally.dart';

Future getProfileUser() async {
  final uri = Uri.parse(kGetProfileUserUrl);
  String token = await getAccessTokenFromPref();
  var response = await http.get(
    uri,
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
  );

  var p = json.decode(response.body);
  // if(p['status']=='1') {
  //   return p['data'];
  // }else {
  //   return [];
  // }
  return p;
}


