import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/model/cart_model.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/utils/constant.dart';

import '../model/account_model.dart';

class CartCard extends StatefulWidget {
  final Data? data;
  final Data? cart;
  final provider;
  final Account? user;
  const CartCard({super.key, this.data, this.user, this.provider, this.cart});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  void initState() {
    super.initState();
    setState(() {
      i = int.parse(widget.cart!.qty);
      stock = int.parse(widget.cart!.menu.stock);
    });
  }

  var i;
  var stock;

  // int qty = int.parse();
  var _count = 0;
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
    int o = int.parse(widget.data!.qty);

    return Column(
      children: [
        Card(
          color: Color(0xffF7F7F7),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: Image.network(
                widget.cart!.menu.image,
                width: 64.0,
                height: 64.0,
              ),
              title: Text(
                widget.cart!.menu.name,
                style: titleStyle,
              ),
              subtitle: Text(
                NumberFormat.currency(
                        locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                    .format(int.parse(widget.data!.menu.price)),
                style: subtitleStyle,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        i == 0 ? i : i--;
                      });
                      var requestBody = {
                        "menu_id": widget.cart!.menuId,
                        "qty": i,
                        "waiter_id": widget.user!.id,
                      };
                      print(requestBody);
                      widget.provider.addCart(requestBody);
                    },
                    icon: Image.asset(
                      "assets/images/minus (1).png",
                      width: 24.0,
                    ),
                  ),
                  Text(
                    "${i}",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Color(0xff282828),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        i < stock ? i++ : null;
                      });
                      var requestBody = {
                        "menu_id": widget.cart!.menuId,
                        "qty": i,
                        "waiter_id": widget.user!.id,
                      };
                      print(requestBody);
                      widget.provider.addCart(requestBody);
                    },
                    icon: Image.asset(
                      "assets/images/more (1).png",
                      width: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
