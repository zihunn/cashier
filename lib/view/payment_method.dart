import 'package:flutter/material.dart';
import '../widget/appbar.dart';
import '../widget/paymentButton.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({super.key});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  List<String> Table = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
    'Table 7',
    'Table 8',
    'Table 9',
    'Table 10',
  ];
  String? selectedTable = 'Table 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        child: CustomAppbar(text: "Payment",),
        preferredSize: const Size.fromHeight(60),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            children: [
              Text(
                "Payment Amount",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Rp. 200.000",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 30.0,
              ),
              PaymentButton()
            ],
          ),
        ),
      ),
    );
  }
}
