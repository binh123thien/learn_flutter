import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
//variables
  var hideInput = false; // khi tính ra kết quả
  var input = '0';
  var output = '0';
  //tạo mảng để lọc trong mảng. Nếu có giá trị thì xử lý
  var disable_button = [
    "7",
    "8",
    "9",
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    '0',
    '00',
    '.',
  ];
//function click
  OnButtonClick(buttonPress) {
    //check click button thi in so
    print(buttonPress);
    //disable button số sau khi có đáp án
    if (hideInput == true) {
      print(disable_button);
      print('uuuuuuuuuuuuuuu');
      //lọc giá trị trong mảng> nếu buttonPress = 1 giá trị trong mảng thì không nhận buttonPress
      for (int i = 0; i < disable_button.length; i++) {
        print(i);
        if (buttonPress == disable_button[i]) {
          print('kkkkkkkkkkk');
          buttonPress = '';
        }
      }
      hideInput = false;
    }

    if (buttonPress == "AC") {
      hideInput = false;
      input = '0';
      output = '0';
    }
    //sửa code
    else if (buttonPress == "⟵") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
        // input.isEmpty == ( input == '' )
        if (input.isEmpty) {
          input = '0';
        }
      }
    } else if (buttonPress == "=") {
      // tạo biến để tính toán
      var userInput = input;
      //khi nhập input x đổi thành '*' để tính toán
      userInput = input.replaceAll("x", "*");

      // tạo expression để phân tích tính toán (phải pub get và thêm thư viện math_express)
      try {
        Parser p = Parser();
        // tạo được biểu thức tính toán dựa vào input nhập vào
        Expression exp = p.parse(userInput);
        print(exp); // kiểm tra biểu thức

        // analyze and evaluate the expression
        ContextModel cm = ContextModel();
        // Evaluate expression:
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        print(eval); // kiểm tra kết quả tính được

        output = eval.toString();
        // trừ 2 đơn vị .0 đằng sau
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
        //gán giá trị vừa tính là input để tính tiếp
        print(output);
        input = output;
        // ẩn input đi
        hideInput = true;

        //hiển thị TH: ban đầu input và output =0 bấm = mất input
        if (input == "0") {
          hideInput = false;
        }
      } catch (e) {
        output = 'Error';
      }
      //TH bấm mấy button khác.
    } else {
      if (input == "0") {
        input = buttonPress;
      } else {
        hideInput = false;
        input = input + buttonPress;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
// initial 2 varible full screen
    double full_Width = MediaQuery.of(context).size.width;
    // or use double.infinity
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
              child: Container(
                width: full_Width,
                padding: EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hideInput ? '' : input,
                        style: TextStyle(fontSize: 48, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        output,
                        style: TextStyle(
                            fontSize: 34, color: Colors.white.withOpacity(0.7)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
            // =========================BUTTON================================
            Row(
              children: [
                button(
                    text: "AC",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
                button(
                    text: "⟵",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
                button(
                    text: "%",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
                button(
                    text: "/",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor)
              ],
            ),
            Row(
              children: [
                button(text: "7"),
                button(text: "8"),
                button(text: "9"),
                button(
                    text: "x",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor)
              ],
            ),
            Row(
              children: [
                button(text: "4"),
                button(text: "5"),
                button(text: "6"),
                button(
                    text: "-",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor)
              ],
            ),
            Row(
              children: [
                button(text: "1"),
                button(text: "2"),
                button(text: "3"),
                button(
                    text: "+",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor)
              ],
            ),
            Row(
              children: [
                // button(text: "", buttonBgColor: Colors.black),
                button(text: "0"),
                button(text: "00"),
                button(text: "."),
                button(text: "=", buttonBgColor: orangeColor)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: buttonBgColor,
              padding: EdgeInsets.all(22)),
          onPressed: () => OnButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25, color: tColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
