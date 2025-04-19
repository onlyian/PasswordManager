import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../utils/urlFetcher.dart';

var store = GetStorage();

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Screen',
          style: TextStyle(fontFamily: 'Anurati'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage('assets/images/user.png'),
              radius: 40,
            ),
            SizedBox(height: 20),

            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                fontFamily: 'Anurati',
              ),
            ),
            SizedBox(height: 20),

            // Email Input
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: usernameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Password Input
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Sign Up Button
            TextButton(
              onPressed: () {
                Get.offAndToNamed("/signup");
              },
              child: Text(
                'New User? Create Account',
                style: TextStyle(color: Colors.blue),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () async {
                String username = usernameController.text.trim();
                String password = passwordController.text.trim();

                if (username.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter both username and password")),
                  );
                  return;
                }

                String apiUrl = await fetchApiUrl();
                await store.write("baseUrl", apiUrl);

                var baseUrl = store.read("baseUrl") ?? "https://localhost";

                var response = await http.post(
                    Uri.parse //will change everytime we restart ngrok(ngrok http 80)
                      ("$baseUrl/password-manager/login.php"),
                    body: {
                      "username": username,
                      "master_password_hash": password,
                    },
                  );

                  print(response.body);

                  final jsonData = json.decode(response.body);

                  if (jsonData["success"] == 1) {

                    store.write("username", username);
                    Get.offAndToNamed("/home");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid credentials")),
                    );
                  }
              },

              icon: Icon(Icons.mail),
              label: Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ),

            SizedBox(height: 10),
            TextButton(
              onPressed: () {Get.offAndToNamed("/home");},
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
