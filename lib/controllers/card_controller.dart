import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/card_model.dart';
import '../utils/urlFetcher.dart';

final store = GetStorage();
String get userId => store.read("user_id").toString();

class CardController extends GetxController {
  var cards = <CardModel>[].obs;


  Future<void> fetchCards() async {
    String baseUrl = store.read("baseUrl") ?? await fetchApiUrl();
    Uri url = Uri.parse("$baseUrl/password-manager/card_read.php");

    try {
      final response = await http.post(
        url,
        body: {'user_id': userId.toString()},
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == 1) {
          cards.value = CardModel.fromJsonList(jsonResponse['data']);
        } else {
          print('Failed to load cards: ${jsonResponse['message']}');
        }
      } else {
        print('Failed to load cards');
      }
    } catch (e) {
      print('Error fetching cards: $e');
    }
  }
}
