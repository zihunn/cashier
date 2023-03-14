import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/component/drawer.dart';
import 'package:kasir/component/navigationDrawer.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/provider/transaction_provider.dart';
import 'package:kasir/view/transactions/detail_transaction.dart';
import 'package:kasir/view/transactions/payment.dart';
import 'package:kasir/view/transactions/payment_method.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../../utils/navigation_helper.dart';
import '../../component/drawer_waiter.dart';

class DashboardCashierView extends StatefulWidget {
  final Account? user;
  const DashboardCashierView({Key? key, this.user}) : super(key: key);

  @override
  State<DashboardCashierView> createState() => _DashboardCashierViewState();
}

class _DashboardCashierViewState extends State<DashboardCashierView> {
  final _colors = [kBlueSoft, kSecondaryColor];
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var date2 = date.toString().split(" ")[0];
    return ChangeNotifierProvider(
      create: (_) => TransactionProvider(),
      child: Consumer<TransactionProvider>(
        builder: (context, transactionProv, child) {
          var listCompleted = transactionProv.completed;
          var listPending = transactionProv.pending;
          return Scaffold(
            endDrawer: NavigationDrawerView(
              data: widget.user,
            ),
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
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black87
                          : Colors.white,
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
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[200]
                          : Colors.white,
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
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            initialValue: null,
                            decoration: const InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
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
                      InkWell(
                        onTap: () {
                          transactionProv.getHistoryCompleted(
                              "completed ", date2);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          child: Text(
                            "Completed",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black87
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          transactionProv.getHistoryPending("pending", date2);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          child: Text(
                            "In Progress",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black87
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
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
            ),
          );
        },
      ),
    );
  }
}
