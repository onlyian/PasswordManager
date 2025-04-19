import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../models/address _model.dart';
import '../utils/urlFetcher.dart';

final store = GetStorage();

class AddressController extends GetxController {
  var addresses = <AddressModel>[].obs;
  var isLoading = true.obs;

  Future<void> fetchAddresses() async {
    isLoading.value = true;
    String baseUrl = store.read("baseUrl") ?? await fetchApiUrl();
    Uri url = Uri.parse("$baseUrl/password-manager/address_read.php");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        addresses.value = AddressModel.fromJsonList(response.body);
        isLoading.value = false;
      } else {
        print('Failed to load addresses');
      }
    } catch (e) {
      print('Error fetching addresses: $e');
    }
  }
}
