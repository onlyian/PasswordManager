import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchApiUrl() async {
  try {
    final response = await http.get(Uri.parse("https://raw.githubusercontent.com/onlyian/dev/main/config.json"));

    print("Fetched API config: ${response.body}");

    final jsonData = json.decode(response.body);
    return jsonData["api_url"];
  } catch (e) {
    print("Error fetching API URL: $e");
    return "https://localhost"; // fallback
  }
}
