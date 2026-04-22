// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();

  String bmiShowValue = '0.00';
  String bmiShowResult = 'การแปรผล';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
            bottom: 50,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวนหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 99, 99, 99),
                  ),
                ),
                SizedBox(height: 20),
                Image(
                  image: AssetImage('assets/images/bmi.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกน้ำหนัก',
                    border: OutlineInputBorder(),
                    contentPadding : EdgeInsets.all(20),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกส่วนสูง',
                    border: OutlineInputBorder(),
                    contentPadding : EdgeInsets.all(20),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (wCtrl.text.isEmpty || hCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 44, 29),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);
                    double bmi = w / ((h / 100) * (h / 100));

                    setState(() {
                      bmiShowValue = bmi.toStringAsFixed(2);
                    });
                    setState(() {
                      if (bmi < 18.5) {
                        bmiShowResult = 'น้ำหนักน้อย / ผอม';
                      } else if (bmi >= 18.5 && bmi < 25) {
                        bmiShowResult = 'น้ำหนักปกติ / สมส่วน';
                      } else if (bmi >= 25 && bmi < 30) {
                        bmiShowResult = 'น้ำหนักมาก / โรคอ้วนระดับ 1';
                      } else if (bmi >= 30 && bmi < 35) {
                        bmiShowResult = 'น้ำหนักมาก / โรคอ้วนระดับ 2';
                      } else if (bmi >= 35 && bmi < 40) {
                        bmiShowResult = 'น้ำหนักมาก / โรคอ้วนระดับ 3';
                      } else {
                        bmiShowResult = 'น้ำหนักมาก / โรคอ้วนระดับ 4';
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 77, 22),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wCtrl.clear();
                      hCtrl.clear();
                      bmiShowValue = '0.00';
                      bmiShowResult = 'การแปรผล';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 148, 148, 148),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(71, 175, 175, 175),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                      Text(
                        bmiShowValue,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 77, 22),
                        ),
                      ),
                      Text(
                        bmiShowResult,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 143, 143, 143),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
