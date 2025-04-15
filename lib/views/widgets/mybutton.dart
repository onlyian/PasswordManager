
import 'package:flutter/material.dart';

Widget myButton(VoidCallback work,{required label, color = Colors.cyan}){
  
  return MaterialButton(
    onPressed: work,
    child: Text(label),
    minWidth: 500,
    color: color,
  );
}