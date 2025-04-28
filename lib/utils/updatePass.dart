import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'urlFetcher.dart';

Future<bool> updatePassword(int id, String website, String username, String email, String password) async {
  final store = GetStorage();
  String baseUrl = store.read("baseUrl") ?? await fetchApiUrl();
  Uri url = Uri.parse("$baseUrl/password-manager/password_update.php");

  var response = await http.post(url, body: {
    "id": id.toString(),
    "website": website,
    "username": username,
    "email": email,
    "password": password,
  });

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
