import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const CalculatorApp(),
    debugShowCheckedModeBanner: false,
    title: "Calculator App",
    theme: ThemeData(primarySwatch: Colors.blueGrey),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
// initial 2 varible full screen
    double full_Width = MediaQuery.of(context).size.width;
    double full_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: const Text(
          "Calculator",
// textAlign: TextAlign.center,     no apply for text in appbar
        ),
      ),

      //full body
      body: Container(
        //arrange with vertical
        child: Column(
          children: [
            //===========================SCREEN=============================================
            Expanded(
              child: SizedBox(
                child: Container(color: Colors.white),
                width: full_Width,
                height: 80,
              ),
            ),
            // =========================BUTTON================================
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          padding: EdgeInsets.all(22)),
                      onPressed: () {},
                      child: Text('1'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
