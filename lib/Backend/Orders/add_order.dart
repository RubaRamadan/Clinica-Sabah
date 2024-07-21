import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Constants/urls.dart';
import '../../Locale_Memory/save_user_info_locally.dart';
import 'package:intl/intl.dart';

Future addOrder(
    {required String balance,
      required String note,
      required String userId,
      required String services,
    }) async {
  final uri = Uri.parse(kAddOrderUrl);
print('object');
print(note);
print(balance);
print(userId);
print(services);
  String token = await getAccessTokenFromPref();
  var response = await http.post(uri,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
      body: {
    'balance': balance,
    'note': note,
    'date': DateFormat('yyyy:MM:dd').format(DateTime.now()),
    'time': DateFormat.Hms().format(DateTime.now()),
    'user_id': userId,
    'services': services,
  }). catchError((err) {
    print('100');
    print(err.response);
    return err.response;
  });
  var p = json.decode(response.body);
  return p;
}
