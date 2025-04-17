import 'package:flutter/material.dart';

Widget MyTextField(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Color.fromARGB(247, 232, 235, 237),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
    ),
  );
}
