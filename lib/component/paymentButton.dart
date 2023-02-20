import 'package:flutter/material.dart';
import '../../view/calculator.dart';
import '../utils/color.dart';
import '../utils/navigation_helper.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            goPush(const CalculatorView());
          },
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            visualDensity: VisualDensity(vertical: -4),
            leading: Image.asset(
              "assets/images/cash-on-delivery.png",
              width: 20.0,
            ),
            title: Center(
                child: Text(
              "Cash",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
            trailing: Image.asset(
              "assets/images/right-arrow.png",
              width: 20.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              side: const BorderSide(color: kCyan),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
        const SizedBox(
          height: 5.0,
        ),
        ElevatedButton(
          onPressed: () {},
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            visualDensity: VisualDensity(vertical: -4),
            leading: Image.asset(
              "assets/images/qr-scan.png",
              width: 20.0,
            ),
            title: Center(
                child: Text(
              "Qris",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
            trailing: Image.asset(
              "assets/images/right-arrow.png",
              width: 20.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              side: const BorderSide(color: kCyan),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      ],
    );
  }
}
