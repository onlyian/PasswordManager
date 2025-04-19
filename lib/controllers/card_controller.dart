import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../models/card_model.dart';
import '../utils/urlFetcher.dart';

final store = GetStorage();

class CardController extends GetxController {
  var cards = <CardModel>[].obs;


  Future<void> fetchCards() async {
    String baseUrl = store.read("baseUrl") ?? await fetchApiUrl();
    Uri url = Uri.parse("$baseUrl/password-manager/card_read.php");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        cards.value = CardModel.fromJsonList(response.body);
      } else {
        print('Failed to load cards');
      }
    } catch (e) {
      print('Error fetching cards: $e');
    }
  }
}
