// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kasir/utils/core/navigation_helper.dart';
import 'package:kasir/view/add_table.dart';
import 'package:kasir/view/editMenu.dart';
import 'package:kasir/view/employee.dart';
import 'package:kasir/view/history.dart';

class NavigationDrawerView extends StatefulWidget {
  const NavigationDrawerView({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerView> createState() => _NavigationDrawerViewState();
}

class _NavigationDrawerViewState extends State<NavigationDrawerView> {
  var index = 0;
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
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  AssetImage("assets/images/team.png")),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Muhammad Rizky"),
                              Text("87391276"),
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
                          goPush(HistoryView());
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
                      title: Text('Edit Menu'),
                      onTap: () {
                        goPush(EditProductView());
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
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
