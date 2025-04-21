
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/utils/urlFetcher.dart';

import '../main.dart';

var store4 = GetStorage();
final userId = user.read("user_id");
Future<bool> insertAddress(
    String name,
    String organization,
    String phone,
    String region,
    String street,
    String city,
    String postalCode,
    ) async {
  String apiUrl = await fetchApiUrl();
  await store4.write("baseUrl", apiUrl);

  var baseUrl = store4.read("baseUrl") ?? "https://localhost";
  var url = Uri.parse("$baseUrl/password-manager/address_save.php");

  var response = await http.post(
    url,
    body: {
      "user_id": userId.toString(),
      "name": name,
      "organization": organization,
      "phone": phone,
      "region": region,
      "street": street,
      "city": city,
      "postal_code": postalCode,
    },
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
