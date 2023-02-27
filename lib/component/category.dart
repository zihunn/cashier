import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/utils/color.dart';
import 'package:math_expressions/math_expressions.dart';

import '../utils/custom_snackbar.dart';

class CategoryCard extends StatefulWidget {
  final Datum? data;
  final provider;
  final Account? user;
  const CategoryCard({Key? key, this.data, this.provider, this.user})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  int _count = 0;
  int p = 9;
  void _incrementCount() {
    setState(() {
      _count < p ? _count++ : null;
    });
  }

  void _decrementCount() {
    setState(() {
      _count == 0 ? _count : _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var stock = int.parse(widget.data!.stock);
    var amount = widget.data!.price;
    return Material(
      color: Color(0xffF7F7F7),
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                widget.data!.image,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Column(
                children: [
                  Text(
                    widget.data!.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 44),
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            color: Colors.amber, shape: BoxShape.circle),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(int.parse(amount)),
                        style: const TextStyle(
                            fontSize: 12,
                            color: kCyan,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: _decrementCount,
                        icon: Image.asset(
                          "assets/images/minus.png",
                          width: 24.0,
                        ),
                      ),
                      Text("${_count}"),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _count < stock ? _count++ : null;
                          });
                        },
                        icon: Image.asset(
                          "assets/images/add.png",
                          width: 24.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  print(widget.user!.id);
                  print(_count);
                  if (_count != 0) {
                    var requestBody = {
                      "menu_id": widget.data!.id,
                      "qty": _count,
                      "waiter_id": widget.user!.id,
                    };
                    widget.provider.addCart(requestBody);
                    widget.provider.getCart(widget.user!.id.toString());
                    _count = 0;
                  } else {
                    errorSnackBar("Qty cannot be empty");
                  }
                },
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
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
          ],
        ),
      ),
    );
    ;
  }
}
