
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/utils/urlFetcher.dart';

import '../main.dart';

var store5 = GetStorage();
final userId = user.read("user_id");
Future<bool> insertCard(
    String cardname,
    String cardholder,
    String cardnumber,
    String brand,
    String expirymonth,
    String expiryyear,
    String cvv,
    ) async {
  String apiUrl = await fetchApiUrl();
  await store5.write("baseUrl", apiUrl);

  var baseUrl = store5.read("baseUrl") ?? "https://localhost";
  var url = Uri.parse("$baseUrl/password-manager/card_save.php");

  var response = await http.post(
    url,
      body: {
        "user_id": userId.toString(),
        "name": cardname,
        "cardholder_name": cardholder,
        "card_number": cardnumber,
        "brand": brand,
        "expiry_month": expirymonth,
        "expiry_year": expiryyear,
        "cvv": cvv,
      }
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
