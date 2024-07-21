import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';


Future getOneService(
    {
      required String id,
    }) async {
  final uri = Uri.parse(kGetOneServiceUrl);
  var response = await http.post(uri, body: {
    'id': id,
  });
  var p = json.decode(response.body);
  return p;
}
