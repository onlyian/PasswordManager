import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../models/password_model.dart';
import '../utils/urlFetcher.dart';

  final store = GetStorage();

class PasswordController extends GetxController {
  var passwords = <PasswordModel>[].obs;

  Future<void> fetchPasswords() async {
    String baseUrl = store.read("baseUrl") ?? await fetchApiUrl();
    Uri url = Uri.parse("$baseUrl/password-manager/password_read.php");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        passwords.value = PasswordModel.fromJsonList(response.body);
      } else {
        print('Failed to load passwords');
      }
    } catch (e) {
      print('Error fetching passwords: $e');
    }
  }
}
