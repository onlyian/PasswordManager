
import 'package:flutter/material.dart';

Widget mytextfield({hintText, prefixIcon, required controller  }){
  return TextField(
controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(borderSide: BorderSide())));


}