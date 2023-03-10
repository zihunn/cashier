import 'package:flutter/material.dart';
import 'package:kasir/model/account_model.dart';
import '../utils/navigation_helper.dart';
import '../view/transactions/historyAdmin.dart';

class DrawerWaiter extends StatefulWidget {
  final Account? data;
  const DrawerWaiter({super.key, this.data});

  @override
  State<DrawerWaiter> createState() => _DrawerWaiterState();
}

class _DrawerWaiterState extends State<DrawerWaiter> {
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
                          goPush(HistoryView(
                            user: widget.data,
                          ));
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
