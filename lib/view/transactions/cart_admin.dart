import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/component/cart.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/model/cart_model.dart';
import 'package:kasir/model/table_model.dart';
import 'package:kasir/component/appbar.dart';
import 'package:kasir/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../../utils/navigation_helper.dart';

class CartAdminView extends StatefulWidget {
  final List<Meja>? table;
  final List<Data>? cart;
  final provider;
  final Account? user;
  const CartAdminView({
    Key? key,
    this.table,
    this.cart,
    this.provider,
    this.user,
  }) : super(key: key);

  @override
  State<CartAdminView> createState() => _CartAdminViewState();
}

class _CartAdminViewState extends State<CartAdminView> {
  var _categorySelectedValue;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var table = widget.table;
    var data = widget.provider.cart;
    // var i = widget.provider.cart;
    return Scaffold(
      appBar: PreferredSize(
          child: CustomAppbar(text: "Cart"),
          preferredSize: Size.fromHeight(70)),
      body: ChangeNotifierProvider(
        create: (_) => DashboardProvider(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(children: [
                Container(
                  width: 170,
                  child: DropdownSearch(
                    items: table?.map((e) {
                      return (e.number);
                    }).toList(),
                    label: "Select Table",
                    popupTitle: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Table"),
                    ),
                    mode: Mode.MENU,
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (value) {
                      setState(() {
                        _categorySelectedValue = value;
                        print(_categorySelectedValue);
                      });
                    },
                    dropdownSearchDecoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: kCyan,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
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
                    controller: nameController,
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
                  ),
                ),
              ]),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Stack(children: [
                    ListView.builder(
                      itemCount: widget.cart!.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = widget.cart?[index];
                        return CartCard(
                          data: item,
                          provider: widget.provider,
                          user: widget.user,
                          cart: item,
                        );
                      },
                    ),
                    Positioned(
                      bottom: 30,
                      right: 10,
                      child: FloatingActionButton.extended(
                        elevation: 2,
                        onPressed: () {
                          var requestBody = {
                            'customer_name': nameController.text,
                            'table_number': _categorySelectedValue,
                            'waiter_id': widget.user?.id,
                          };
                          widget.provider.createTransaction(requestBody);
                          widget.cart!.clear();
                          goBack();
                        },
                        extendedPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        label: const Text('Make an order'),
                        icon: Image.asset(
                          "assets/images/note.png",
                          width: 30.0,
                        ),
                        backgroundColor: kCyan,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
