import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';
import '../../Locale_Memory/save_user_info_locally.dart';

Future getResponses() async {
  final uri = Uri.parse(kGetResponsesUrl);
  String id = await getAccessTokenFromPref();
  String token = await getAccessTokenFromPref();
  var response = await http.post(
    uri,
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },
    body: {
      'user_id':id
    }
  );

  var p = json.decode(response.body);
  // if(p['status']=='1') {
  //   return p['data'];
  // }else {
  //   return [];
  // }
  return p;
}


