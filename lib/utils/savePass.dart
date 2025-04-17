import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/utils/urlFetcher.dart';


var store3 = GetStorage();

Future<bool> insertPassword(String website, String username, String email, String password) async {

  String apiUrl = await fetchApiUrl();
  await store3.write("baseUrl", apiUrl);

  var baseUrl = store3.read("baseUrl") ?? "https://default.ngrok-free.app";
  var url =  Uri.parse("$baseUrl/password-manager/password_save.php");

  var response = await http.post(
      url,
      body: {
    "website": website,
    "username": username,
    "email": email,
    "password": password,
  });
  if (response.statusCode == 200) //check if successful http connection(200 means success)
    //thus body data is correct:
      {
    return true;
  } else {
    return false;
  }
}
