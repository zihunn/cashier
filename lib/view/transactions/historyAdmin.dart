import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/provider/transaction_provider.dart';
import 'package:kasir/view/transactions/detail_transaction.dart';
import 'package:kasir/view/transactions/payment.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../../utils/navigation_helper.dart';
import '../../component/appbar.dart';

var now = DateTime.now();
var firstDay = DateTime(now.year, now.month - 3, now.day);
var lastDay = DateTime(now.year, now.month + 3, now.day);

class HistoryView extends StatefulWidget {
  final Account? user;
  const HistoryView({Key? key, this.user}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  var date = new DateTime(2023, 3, 1);

  DateTime today = DateTime.now();

  final _colors = [kBlueSoft, kSecondaryColor];

  CalendarFormat format = CalendarFormat.twoWeeks;

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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff7DE5ED),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TableCalendar(
                              focusedDay: now,
                              firstDay: firstDay,
                              lastDay: lastDay,
                              calendarFormat: format,
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              headerStyle: const HeaderStyle(
                                leftChevronIcon: Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                                headerPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                formatButtonVisible: false,
                                titleCentered: true,
                                titleTextStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              calendarStyle: const CalendarStyle(
                                  weekendDecoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  weekendTextStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  defaultTextStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  selectedTextStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  selectedDecoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  todayDecoration: BoxDecoration(
                                      color: Color(0xffB3FFAE),
                                      shape: BoxShape.circle),
                                  todayTextStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                              calendarBuilders:
                                  CalendarBuilders(dowBuilder: (context, day) {
                                String text;
                                if (day.weekday == DateTime.sunday) {
                                  text = "Sun";
                                } else if (day.weekday == DateTime.monday) {
                                  text = "Mon";
                                } else if (day.weekday == DateTime.tuesday) {
                                  text = "Tue";
                                } else if (day.weekday == DateTime.wednesday) {
                                  text = "Wed";
                                } else if (day.weekday == DateTime.thursday) {
                                  text = "Thu";
                                } else if (day.weekday == DateTime.friday) {
                                  text = "Fri";
                                } else if (day.weekday == DateTime.saturday) {
                                  text = "Sat";
                                } else {
                                  text = " err";
                                }
                                return Center(
                                  child: Text(
                                    text,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                              selectedDayPredicate: (day) =>
                                  isSameDay(day, now),
                              onDaySelected: ((selectedDay, focusedDay) {
                                setState(() {
                                  now = focusedDay;
                                  var date = selectedDay;
                                  var date2 = date.toString().split(" ")[0];
                                  transactionProv.getHistoryPending(
                                      "pending", date2);
                                  transactionProv.getHistoryCompleted(
                                      "completed ", date2);
                                });
                              }),
                            ),
                          ),
                        )
                      : Container(),
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
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black54
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "In Progress",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black54
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
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
                                                children: [
                                                  VerticalDivider(
                                                    color: Colors.black,
                                                  ),
                                                  RotatedBox(
                                                      quarterTurns: -1,
                                                      child: Text(
                                                        "Succeed",
                                                        style: TextStyle(
                                                            color: Colors.green,
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
                                                  VerticalDivider(
                                                    color: Colors.black,
                                                  ),
                                                  RotatedBox(
                                                      quarterTurns: -1,
                                                      child: Text(
                                                        "Pending",
                                                        style: TextStyle(
                                                            color: Colors.red,
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
