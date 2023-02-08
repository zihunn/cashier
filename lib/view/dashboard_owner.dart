// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kasir/widget/drawer.dart';

import '../utils/core/color.dart';
import '../utils/core/constant.dart';
import 'package:flutter/src/material/tab_controller.dart';

import '../utils/core/navigation_helper.dart';
import 'detail_transaction.dart';

class DashboardOwnerView extends StatefulWidget {
  const DashboardOwnerView({Key? key}) : super(key: key);

  @override
  State<DashboardOwnerView> createState() => _DashboardOwnerViewState();
}

class _DashboardOwnerViewState extends State<DashboardOwnerView> {
  final tabList = ['Tab 1', 'Tab 2'];

  final _colors = [kBlueSoft, kSecondaryColor];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerView(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("brunch", style: headingStyle),
            Text("Restaurnt", style: headingStyle),
          ],
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
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
                unselectedLabelColor: Colors.black38,
                labelColor: Colors.black,
                indicatorColor: kCyan,
                tabs: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Completed",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "In Progress",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: ListView.builder(
                      itemCount: 16,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            goPush(DetailTransactionView());
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          "Succeed",
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
                  Center(
                    child: Text("text"),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
