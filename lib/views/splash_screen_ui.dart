import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    //หน่วงเวลา 3 วินาที ก่อนเปลี่ยนไปหน้า HomeScreen แบบย้อนกลับไม่ได้
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 79, 9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Body Health Calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(218, 255, 255, 255),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '© 2026 All rights reserved.',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(157, 190, 190, 190),
              ),
            ),
            Text(
              'Created by: Copter SAU',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(157, 190, 190, 190),
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              color: const Color.fromARGB(185, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
