import 'package:flutter/material.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/view/add_table.dart';
import 'package:kasir/view/employee.dart';
import 'package:kasir/view/history.dart';

import '../utils/navigation_helper.dart';
import '../view/menu/listMenu.dart';

class NavigationDrawerView extends StatefulWidget {
  final Account? data;
  const NavigationDrawerView({Key? key, this.data}) : super(key: key);

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
                          goPush(HistoryView());
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
                      title: Text('Edit Menu'),
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
