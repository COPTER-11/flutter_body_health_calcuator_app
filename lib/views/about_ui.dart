import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Body Health calculator",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 72, 0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/logo.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  'คำนวนหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'คำนวนหาค่าแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/47/Logosau-02.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  height: 5
                ),
                Text(
                  'Developed by Copter SAU 2026',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
