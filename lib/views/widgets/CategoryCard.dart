import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget CategoryCard({required Color color, required Color iconBg,
  required String icon, required double screenWidth, required double screenHeight,}) {
  return Container(
    width: screenWidth * 0.28,
    height: screenHeight * 0.15,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 0.5,
      child: Container(
        decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(icon, height: 10),
        ),
      ),
    ),
  );
}