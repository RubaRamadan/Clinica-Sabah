import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';

Future getServices() async {
  print('object');
  final uri = Uri.parse(kGetServicesUrl);
  // String token = await getAccessTokenFromPref();
  var response = await http.get(
    uri,
    // headers: {
    //   "Accept": "application/json",
    //   "Authorization": "Bearer $token"
    // },
  );

  var p = json.decode(response.body);
  print('p $p');
  return p;
  // if(p['status']=='1') {
  //   return p['data'];
  // }else {
  //   return [];
  // }
}


