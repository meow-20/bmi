import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  String result = "Submit your data to calculate your BMI";
  Color bg = Color.fromARGB(255, 228, 228, 228);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Your Data:",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monitor_weight),
                      hintText: 'Enter your weight in KGs',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.pink)))),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: htController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Allows only digits (0-9)
                  ],
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height),
                      hintText: 'Enter your height in CMs',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.pink)))),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 50, left: 0, right: 0, bottom: 10),
              child: Text("$result"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black12,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green.shade900),
                  onPressed: () {
                    if (wtController.text.isEmpty ||
                        htController.text.isEmpty) {
                      setState(() {
                        result = "Please enter both your height and weight";
                      });
                      return;
                    }
                    var wt = int.parse(wtController.text);
                    var ht = int.parse(htController.text);
                    var bmi = wt / (ht * ht / 10000);

                    if (bmi < 18.5) {
                      // underweight
                      setState(() {
                        bg = Colors.yellow.shade300;
                        result =
                            "Your Body Mass Index is ${bmi.toStringAsFixed(2)}. You are Underweight.";
                      });
                    } else if (bmi > 18.5 && bmi < 24.9) {
                      // normalweight
                      setState(() {
                        bg = Colors.green.shade300;
                        result =
                            "Your Body Mass Index is ${bmi.toStringAsFixed(2)}. You are Normal.";
                      });
                    } else if (bmi > 25 && bmi < 30) {
                      // overweight
                      setState(() {
                        bg = Colors.orange.shade300;
                      result =
                          "Your Body Mass Index is ${bmi.toStringAsFixed(2)}. You are Overweight.";
                      });
                    } else if (bmi > 30 && bmi < 35) {
                      // obese class 1
                      setState(() {
                        bg = Colors.deepOrange.shade300;
                      result =
                          "Your Body Mass Index is ${bmi.toStringAsFixed(2)}. You are Obese Class 1.";
                      });
                    } else if (bmi > 35 && bmi < 40) {
                      // obese class 2
                      setState(() {
                        bg = Colors.red.shade300;
                      result =
                          "Your Body Mass Index is ${bmi.toStringAsFixed(2)}. You are Obese Class 2.";
                      });
                    } else {
                      // severe obese
                      setState(() {
                        bg = Colors.purple.shade300;
                      result =
                          "Your Body Mass Index is ${bmi.toStringAsFixed(2)}. You are Severe Obese.";
                      });
                    }
                  },
                  child: Text("Submit")),
            ),
          ],
        ),
      ),
    );
  }
}
