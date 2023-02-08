// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kasir/utils/core/navigation_helper.dart';
import 'package:kasir/view/payment_method.dart';

import '../utils/core/color.dart';
import '../utils/core/constant.dart';
import '../widget/drawer_waiter.dart';

class DashboardCashierView extends StatefulWidget {
  const DashboardCashierView({Key? key}) : super(key: key);

  @override
  State<DashboardCashierView> createState() => _DashboardCashierViewState();
}

class _DashboardCashierViewState extends State<DashboardCashierView> {
  final _colors = [kBlueSoft, kSecondaryColor];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWaiter(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 14, top: 10),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Cashier",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: Image.asset(
                      "assets/images/menu.png",
                      width: 40,
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[400]!,
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: "Search",
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.black,
              indicatorColor: kCyan,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    "Completed",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    "In Progress",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Center(
                  child: Text("text"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: ListView.builder(
                    itemCount: 16,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          goPush(PaymentMethodView());
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          color: _colors[index % _colors.length],
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/transaction-history.png",
                                width: 60,
                                height: 40,
                              ),
                              title: Text(
                                "Id. 34256",
                                style: titleStyle,
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Table 5",
                                      style: subtitleStyle,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Customer : Zihunn",
                                      style: subtitleStyle,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Rp. 200.000",
                                      style: subtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  VerticalDivider(),
                                  RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(
                                        "Pending",
                                        style: const TextStyle(fontSize: 10),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
