import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kasir/view/payment_method.dart';
import 'package:kasir/widget/appbar.dart';
import '../utils/color.dart';
import '../utils/constant.dart';
import '../utils/navigation_helper.dart';

class CartAdminView extends StatefulWidget {
  const CartAdminView({Key? key}) : super(key: key);

  @override
  State<CartAdminView> createState() => _CartAdminViewState();
}

class _CartAdminViewState extends State<CartAdminView> {
  List<String> table = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CustomAppbar(text: "Cart"),
          preferredSize: Size.fromHeight(70)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(children: [
              Container(
                width: 170,
                child: DropdownSearch<String>(
                  items: table,
                  label: "Select Table",
                  popupTitle: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Table"),
                  ),
                  mode: Mode.MENU,
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: (value) {
                    print(value);
                  },
                  dropdownSearchDecoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: kCyan,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kCyan,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                width: 170,
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: kCyan,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kCyan,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ]),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Stack(children: [
                  ListView.builder(
                    itemCount: 15,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          "assets/images/spaghetti.png",
                          width: 50,
                        ),
                        title: Text(
                          "Spaghetti",
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          "20.000",
                          style: subtitleStyle,
                        ),
                        trailing: Text("1x"),
                      );
                    },
                  ),
                  Positioned(
                    right: -20,
                    bottom: 10,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          onPressed: () {},
                          child: IconButton(
                            onPressed: () {
                              goPush(PaymentMethodView());
                            },
                            icon: Image.asset(
                              "assets/images/pay.png",
                              width: 64.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
