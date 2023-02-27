// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/model/pending_model.dart';
import 'package:kasir/utils/color.dart';
import 'package:kasir/utils/constant.dart';
import 'package:kasir/utils/navigation_helper.dart';
import 'package:kasir/view/transactions/receipt.dart';

class PaymentView extends StatefulWidget {
  final Account? user;
  final Datum? data;
  final provider;
  const PaymentView({Key? key, this.user, this.data, this.provider})
      : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  var _index = 0;
  var index = 0;
  int _count = 0;
  double bill = 0;
  double tip = 0;
  double discount = 0;
  int person = 1;
  double tipPerPerson = 0;
  double totalPerPerson = 0;

  var persons = 0;
  var _payment = 'Cash';

  TextEditingController billController = TextEditingController();
  TextEditingController tipController = TextEditingController();
  TextEditingController personController = TextEditingController();

  @override
  void initState() {
    billController = TextEditingController(text: widget.data!.total);
    bill = double.parse(billController.text);
    super.initState();
  }

  void calculate() {
    tipPerPerson = (bill * tip) / person;
    totalPerPerson = (bill * tip) / 100;
  }

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count == 0 ? _count : _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double discountValue = (bill * discount) / 100;
    double value = bill - discountValue;
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    String s = value.toString().replaceAll(regex, '');
    var detail = widget.data;
    var pay = widget.provider.payments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Payment",
          style: headingStyle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // print(detail!.payment);
            goBack();
          },
          icon: Image.asset(
            "assets/images/left.png",
            width: 30.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 25, right: 25),
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    width: width,
                    height: 180.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffDDDDDD),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Total Discount",
                          style: headingStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(value),
                          style: headingStyle2.copyWith(color: Colors.amber),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Divider(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Total bill",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.black, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(bill),
                                  style: headingStyle2.copyWith(
                                      color: kPrimaryColor),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Discount",
                                  style: subtitleStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: '% ',
                                          decimalDigits: 0)
                                      .format(discount),
                                  // "Rp. ${totalPerPerson.toStringAsFixed(3)}",
                                  style: headingStyle2.copyWith(
                                      color: kPrimaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter",
                            style: headingStyle2,
                          ),
                          Text(
                            "bill",
                            style: subtitleStyle,
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 250,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: billController,
                          onEditingComplete: () {
                            setState(
                              () {
                                if (billController.text.isNotEmpty) {
                                  bill = double.parse(billController.text);
                                } else {
                                  bill = 0;
                                }
                                FocusScope.of(context).unfocus();
                                calculate();
                              },
                            );
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Ionicons.wallet_outline,
                              ),
                              fillColor: kBlueSoft,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose",
                            style: headingStyle2,
                          ),
                          Text(
                            "discount",
                            style: subtitleStyle,
                          ),
                        ],
                      ),
                      Container(
                        width: 255,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 26),
                                  elevation: 0,
                                  primary: _index == 1
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  print(widget.user?.role);
                                  discount = 5;
                                });
                                _index = 1;
                              },
                              child: Text(
                                "5%",
                                style: headingStyle2.copyWith(
                                  color:
                                      _index == 1 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 24),
                                  elevation: 0,
                                  primary: _index == 2
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  discount = 10;
                                  calculate();
                                });
                                _index = 2;
                              },
                              child: Text(
                                "10%",
                                style: headingStyle2.copyWith(
                                  color:
                                      _index == 2 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 24),
                                  elevation: 0,
                                  primary: _index == 3
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    discount = 15;
                                    calculate();
                                  });
                                });
                                _index = 3;
                              },
                              child: Text(
                                "15%",
                                style: headingStyle2.copyWith(
                                  color:
                                      _index == 3 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 70,
                        width: 250,
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: tipController,
                          onEditingComplete: () {
                            _index = 4;
                            setState(
                              () {
                                if (tipController.text.isNotEmpty) {
                                  discount = double.parse(tipController.text);
                                } else {
                                  discount = 0;
                                }
                                FocusScope.of(context).unfocus();
                                calculate();
                              },
                            );
                          },
                          decoration: InputDecoration(
                            labelText: "Custom Discount",
                            labelStyle: subtitleStyle,
                            fillColor: kBlueSoft,
                            prefixIcon: Icon(
                              Icons.percent,
                              size: 16,
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose",
                            style: headingStyle2,
                          ),
                          Text(
                            "Payment",
                            style: subtitleStyle,
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 22),
                                  elevation: 0,
                                  primary: index == 0
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  index = 0;
                                  _payment = 'Cash';
                                  print(_payment);
                                });
                              },
                              child: Text(
                                "Cash",
                                style: headingStyle2.copyWith(
                                  color:
                                      index == 0 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 22),
                                  elevation: 0,
                                  primary: index == 1
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  index = 1;

                                  _payment = 'Debit';
                                  print(_payment);
                                });
                              },
                              child: Text(
                                "Debit",
                                style: headingStyle2.copyWith(
                                  color:
                                      index == 1 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 22),
                                  elevation: 0,
                                  primary: index == 2
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  index = 2;

                                  _payment = 'Qris';
                                  print(_payment);
                                });
                              },
                              child: Text(
                                "Qris",
                                style: headingStyle2.copyWith(
                                  color:
                                      index == 2 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 645),
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    var data = {
                      'cashier_id': 12,
                      'payment_method': "cash",
                      'payment': 353000,
                      'discount': 5
                    };
                    print(data);

                    widget.provider.payment(widget.data!.id, widget.user!.id,
                        "cash", int.parse(s), discount);
                    widget.provider.getDetail(widget.data!.id);
                    goPush(ReceiptView(
                      payment: _payment,
                      ds: discount,
                      test: value.toString(),
                      data: detail,
                      provider: widget.provider,
                      user: widget.user,
                    ));
                  },
                  // ignore: sort_child_properties_last
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
                        "Receive payment",
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
            ),
          ],
        ),
      ),
    );
  }
}
