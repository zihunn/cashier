// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:kasir/utils/core/color.dart';
import 'package:kasir/utils/core/constant.dart';
import 'package:kasir/utils/core/navigation_helper.dart';
import 'package:kasir/view/mybutton.dart';
import 'package:kasir/view/receipt.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  var userQuestion = '';

  var userAnswer = '';

  final myTextStyle = TextStyle(fontSize: 30, color: Colors.black);

  final List<String> buttons = [
    '7',
    '8',
    '9',
    'Hapus',
    '4',
    '5',
    '6',
    '210.000',
    '1',
    '2',
    '3',
    '205.000',
    '0',
    '00',
    '000',
    'Uang Pas',
  ];
  bool isOprator(String x) {
    if (x == '%' || x == ':' || x == 'x' || x == '_' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            goBack();
          },
          icon: Image.asset(
            "assets/images/left.png",
            width: 30.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Container(
                  height: 190,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    userQuestion,
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Vanilla',
                      color: kBlue,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    userAnswer,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontFamily: 'Vanilla',
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Container(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    if (index == 3) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          color: kBlue,
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        ),
                      );
                    } else if (index == 7 || index == 11 || index == 15) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          color: kBlue,
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        ),
                      );
                    } else {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          color: isOprator(buttons[index])
                              ? Color(0xffBCE5FE)
                              : Colors.white,
                          textColor: isOprator(buttons[index]) ? kBlue : kBlue,
                          buttonText: buttons[index],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            width: width,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(0, -1),
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  goPush(const ReceiptView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/cash-on-delivery.png",
                      width: 16,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      "Terima Pembayaran",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: kPrimaryColor,
                  side: const BorderSide(color: kCyan),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
