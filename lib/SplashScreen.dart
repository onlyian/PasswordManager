import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: SplashScreenPainter(),
        child: Center(
          child: Image.asset('assets/icon/logo.png'),
        ),
      ),
    );
  }
}
class SplashScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Top triangle - Cyan
    paint.color = Colors.cyan;
    final topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(topPath, paint);

    // Bottom triangle - Black
    paint.color = Colors.black;
    final bottomPath = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}