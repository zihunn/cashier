import 'package:flutter/material.dart';
import '../utils/core/color.dart';

class ButtonRemoveView extends StatelessWidget {
  final onPressed;
  const ButtonRemoveView({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/printer.png",
            width: 16,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            "Print Receipt",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: kPrimaryColor,
          side: BorderSide(color: kCyan),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
