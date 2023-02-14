import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:kasir/utils/navigation_helper.dart';
import 'package:kasir/widget/drawer.dart';
import '../utils/color.dart';
import '../utils/constant.dart';
import 'detail_transaction.dart';

class DashboardOwnerView extends StatefulWidget {
  const DashboardOwnerView({Key? key}) : super(key: key);

  @override
  State<DashboardOwnerView> createState() => _DashboardOwnerViewState();
}

class _DashboardOwnerViewState extends State<DashboardOwnerView> {
  var date = new DateTime(2023, 2, 9);
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
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: DatePicker(
                    DateTime(date.year, date.month, date.day - 8),
                    height: 100,
                    width: 60,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: kPrimaryColor,
                    selectedTextColor: Colors.white,
                    deactivatedColor: Colors.amber,
                    monthTextStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    dayTextStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    dateTextStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    daysCount: 30,
                  )),
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
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            goPush(const DetailTransactionView());
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
                                  children: const [
                                    VerticalDivider(),
                                    RotatedBox(
                                        quarterTurns: -1,
                                        child: Text(
                                          "Succeed",
                                          style: TextStyle(fontSize: 10),
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
                  SingleChildScrollView(
                    controller: ScrollController(),
                    child: const Center(
                      child: Text("text"),
                    ),
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
