import 'package:flutter/material.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/model/pending_model.dart';
import 'package:kasir/view/add_table.dart';
import 'package:kasir/view/authentication/login.dart';
import 'package:kasir/view/authentication/test.dart';
import 'package:kasir/view/employee.dart';
import 'package:kasir/view/transactions/historyAdmin.dart';
import '../utils/navigation_helper.dart';
import '../view/menu/listMenu.dart';

class NavigationDrawerView extends StatefulWidget {
  final Account? data;
  final provider;
  const NavigationDrawerView({Key? key, this.data, this.provider})
      : super(key: key);

  @override
  State<NavigationDrawerView> createState() => _NavigationDrawerViewState();
}

class _NavigationDrawerViewState extends State<NavigationDrawerView> {
  var _index = 0;
  bool _iconBool = false;
  IconData _light = Icons.wb_sunny;
  IconData _dark = Icons.nights_stay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: widget.data!.role == 'admin'
                    ? Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 45,
                                    height: 45,
                                    child: Image.asset(
                                        "assets/images/administrator.png"),
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.data!.name),
                                      Text(widget.data!.id.toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Divider(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: ListTile(
                                leading: Image.asset(
                                  "assets/images/bill.png",
                                  width: 30,
                                ),
                                title: Text('Transaction'),
                                onTap: () {
                                  goPush(HistoryView(
                                    user: widget.data,
                                  ));
                                  // print(widget.data?.id);
                                }),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/menu2.png",
                                width: 35,
                              ),
                              title: Text('Menu'),
                              onTap: () {
                                goPush(ListMenuView());
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: ListTile(
                                leading: Image.asset(
                                  "assets/images/dinner-table.png",
                                  width: 35,
                                ),
                                title: Text('Add Table'),
                                onTap: () {
                                  goPush(AddTableView());
                                }),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/cash-counter.png",
                                width: 35,
                              ),
                              title: Text('Employee'),
                              onTap: () {
                                goPush(EmployeView());
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: ListTile(
                                leading: Image.asset(
                                  "assets/images/logout.png",
                                  width: 30,
                                ),
                                title: Text('Logout'),
                                onTap: () {
                                  goRemove(FirstPage());
                                }),
                          ),
                        ],
                      )
                    : widget.data!.role == "waiter"
                        ? Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        width: 40,
                                        height: 40,
                                        child: Image.asset(
                                            "assets/images/waitress.png"),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.data!.name),
                                          Text(widget.data!.id.toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 3,
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/menu2.png",
                                    width: 35,
                                  ),
                                  title: Text('Menu'),
                                  onTap: () {
                                    goPush(ListMenuView());
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 3,
                                child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/logout.png",
                                      width: 30,
                                    ),
                                    title: Text('Logout'),
                                    onTap: () {
                                      goRemove(FirstPage());
                                    }),
                              ),
                            ],
                          )
                        : widget.data!.role == 'cashier'
                            ? Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            width: 45,
                                            height: 45,
                                            child: Image.asset(
                                                "assets/images/cashier2.png"),
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(widget.data!.name),
                                              Text(widget.data!.id.toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Divider(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 3,
                                    child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/logout.png",
                                          width: 30,
                                        ),
                                        title: Text('Logout'),
                                        onTap: () {
                                          goRemove(FirstPage());
                                        }),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            width: 45,
                                            height: 45,
                                            child: Image.asset(
                                                "assets/images/ownership.png"),
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(widget.data!.name),
                                              Text(widget.data!.id.toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Divider(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 3,
                                    child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/logout.png",
                                          width: 30,
                                        ),
                                        title: Text('Logout'),
                                        onTap: () {
                                          goRemove(FirstPage());
                                        }),
                                  ),
                                ],
                              ))
          ],
        ),
      ),
    );
  }
}
