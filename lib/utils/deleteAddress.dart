import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'urlFetcher.dart';

Future<bool> deleteAddress(int id) async {
  final store = GetStorage();
  String baseUrl = store.read("baseUrl") ?? await fetchApiUrl();
  Uri url = Uri.parse("$baseUrl/password-manager/address_delete.php");

  final response = await http.post(url, body: {'id': id.toString()});

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['success'] == 1;
  } else {
    return false;
  }
}
