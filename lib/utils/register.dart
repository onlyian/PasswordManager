import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_screen/utils/urlFetcher.dart';



var store2 = GetStorage();
Future<bool> registerUser(String username, String email, String password) async {

  String apiUrl = await fetchApiUrl();
  await store2.write("baseUrl", apiUrl);

  var baseUrl = store2.read("baseUrl") ?? "https://localhost";

  var response = await http.post(
    Uri.parse("$baseUrl/password-manager/register.php"),
    body: {
      "username": username,
      "email": email,
      "master_password_hash": password,
    },
  );
  if (response.statusCode == 200) //check if successful http connection(200 means success)
    //thus body data is correct:
  {
    var jsonData = jsonDecode(response.body);
    return jsonData["success"] == 1;
  } else {
    return false;
  }
}

