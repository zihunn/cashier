import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/utils/core/color.dart';
import 'package:kasir/utils/core/constant.dart';
import 'package:kasir/view/detail_transaction.dart';
import '../utils/core/navigation_helper.dart';
import 'package:date_picker_timeline/date_widget.dart';

import '../widget/appbar.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final _colors = [kBlueSoft, kSecondaryColor];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppbar(
          text: "Transaction History",
        ),
        preferredSize: const Size.fromHeight(60),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                  child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 60,
                initialSelectedDate: DateTime.now(),
                selectionColor: kPrimaryColor,
                selectedTextColor: Colors.white,
                deactivatedColor: Colors.amber,
                monthTextStyle: TextStyle(
                  color: Colors.grey,
                ),
                dayTextStyle: TextStyle(
                  color: Colors.grey,
                ),
                dateTextStyle: TextStyle(
                  color: Colors.grey,
                ),
                daysCount: 22,
              )),
            ),
            TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.black,
              indicatorColor: kCyan,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    "Completed",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "In Progress",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
    );
  }
}
