// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kasir/utils/core/color.dart';

class DialogAddTableView extends StatefulWidget {
  const DialogAddTableView({Key? key}) : super(key: key);

  @override
  State<DialogAddTableView> createState() => _DialogAddTableViewState();
}

class _DialogAddTableViewState extends State<DialogAddTableView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            padding: EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kCyan,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kCyan,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Add New Table",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add Table",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Image.asset(
                          "assets/images/add.png",
                          width: 16,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: kPrimaryColor,
                        side: const BorderSide(color: kCyan),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -45,
            child: Image.asset(
              "assets/images/dinner.png",
              width: 74.0,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
