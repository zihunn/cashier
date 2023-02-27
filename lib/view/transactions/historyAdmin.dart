import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/provider/transaction_provider.dart';
import 'package:kasir/view/transactions/detail_transaction.dart';
import 'package:kasir/view/transactions/payment.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../../utils/navigation_helper.dart';
import '../../component/appbar.dart';

class HistoryView extends StatefulWidget {
  final Account? user;
  const HistoryView({Key? key, this.user}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  var date = new DateTime(2023, 2, 9);
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
      body: ChangeNotifierProvider(
        create: (_) => TransactionProvider(),
        child: Consumer<TransactionProvider>(
          builder: (context, transactionProv, child) {
            var listCompleted = transactionProv.completed;
            var listPending = transactionProv.pending;
            return DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.user!.role == "admin"
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Container(
                              child: DatePicker(
                            DateTime(date.year, date.month, date.day - 8),
                            height: 100,
                            width: 60,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: kPrimaryColor,
                            selectedTextColor: Colors.white,
                            deactivatedColor: Colors.amber,
                            onDateChange: (selectedDate) {
                              var date = selectedDate;
                              var date2 = date.toString().split(" ")[0];
                              transactionProv.getHistoryPending(
                                  "pending", date2);
                              transactionProv.getHistoryCompleted(
                                  "completed ", date2);
                            },
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
                        )
                      : Container(),
                  const TabBar(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
                    unselectedLabelColor: Colors.black38,
                    labelColor: Colors.black,
                    indicatorColor: kCyan,
                    tabs: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, top: 20),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "In Progress",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      transactionProv.isLoading
                          ? Container(
                              padding: EdgeInsets.only(
                                  bottom: 120, right: 150, left: 150),
                              width: 100,
                              child: Lottie.asset("assets/lottie/loading.json"))
                          : listCompleted!.isEmpty
                              ? Container(
                                  padding: EdgeInsets.only(
                                      bottom: 120, right: 60, left: 60),
                                  width: 100,
                                  child:
                                      Lottie.asset("assets/lottie/empty.json"))
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: ListView.builder(
                                    itemCount: listCompleted.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var p = listCompleted[index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // transactionProv.getDetail(p.id);
                                            // Future.delayed(Duration(seconds: 2));
                                            goPush(DetailTransactionView(
                                              data: p,
                                            ));
                                          });
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          color:
                                              _colors[index % _colors.length],
                                          elevation: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14),
                                            child: ListTile(
                                              leading: Image.asset(
                                                "assets/images/transaction-history.png",
                                                width: 60,
                                                height: 40,
                                              ),
                                              title: Text(
                                                "Id. ${p.id}",
                                                style: titleStyle,
                                              ),
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Table ${p.tableNumber}",
                                                      style: subtitleStyle,
                                                    ),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "Customer :  ${p.customerName}",
                                                      style: subtitleStyle,
                                                    ),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: 'Rp ',
                                                              decimalDigits: 0)
                                                          .format(int.parse(
                                                              p.total)),
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
                                                        style: TextStyle(
                                                            fontSize: 10),
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
                      transactionProv.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : listPending!.isEmpty
                              ? Container(
                                  padding: EdgeInsets.only(
                                      bottom: 120, right: 60, left: 60),
                                  width: 100,
                                  child:
                                      Lottie.asset("assets/lottie/empty.json"))
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: ListView.builder(
                                    itemCount: listPending.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var test = listPending[index];
                                      return GestureDetector(
                                        onTap: () {
                                          print(widget.user?.role);
                                          goPush(PaymentView(
                                            user: widget.user,
                                            data: test,
                                            provider: transactionProv,
                                          ));
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          color:
                                              _colors[index % _colors.length],
                                          elevation: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14),
                                            child: ListTile(
                                              leading: Image.asset(
                                                "assets/images/transaction-history.png",
                                                width: 60,
                                                height: 40,
                                              ),
                                              title: Text(
                                                "Id. ${test.id}",
                                                style: titleStyle,
                                              ),
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Table ${test.tableNumber}",
                                                      style: subtitleStyle,
                                                    ),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "Customer : ${test.customerName}",
                                                      style: subtitleStyle,
                                                    ),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: 'Rp ',
                                                              decimalDigits: 0)
                                                          .format(int.parse(
                                                              test.total)),
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
                                                        "Pending",
                                                        style: TextStyle(
                                                            fontSize: 10),
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
            );
          },
        ),
      ),
    );
  }
}
