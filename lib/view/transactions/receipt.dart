import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/model/payment_model.dart';
import 'package:kasir/model/pending_model.dart';
import 'package:kasir/utils/navigation_helper.dart';
import 'package:kasir/view/dashboard/dashboard_admin.dart';
import 'package:kasir/view/dashboard/dashboard_waiter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReceiptView extends StatefulWidget {
  final Datum? data;
  final Account? user;
  final payment;
  final provider;
  final test;
  final ds;
  const ReceiptView({
    Key? key,
    this.data,
    this.provider,
    this.user,
    this.test,
    this.ds,
    this.payment,
  }) : super(key: key);

  @override
  State<ReceiptView> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  // Page
  Future<void> pp() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    var payment = widget.payment;
    var dis = widget.ds;
    var data = widget.data;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              if (widget.user!.role == 'admin') {
                goBack();
                goBack();
                goBack();
                goBack();
              } else {
                goBack();
                goBack();
              }
            },
            icon: Image.asset(
              "assets/images/close.png",
              width: 50,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                "assets/lottie/success.json",
                width: 100.0,
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Text(
              "payment successfully",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black87
                    : Colors.white,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                child: Column(children: [
                  const Text(
                    "Total Payment",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(double.parse('${widget.test}')),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Id Transaction",
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        data!.id.toString(),
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Customer Name",
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        data.customerName,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Table",
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        data.tableNumber,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: data.items.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = data.items[index];
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        title: Text(
                          item.menu.name,
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: 'Rp ')
                                  .format(int.parse(item.menu.price)),
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "  x  ${item.qty}",
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          NumberFormat.currency(
                                  locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                              .format(int.parse(item.subtotal)),
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 0.8,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                            .format(int.parse(data.total)),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.8,
                    color: Colors.black,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 0.8,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(double.parse('${widget.test}')),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${dis.toString().replaceAll(regex, ' ')} %',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "transaction time",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd').format(data.updatedAt),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "payment method",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Text(
                            payment,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Container(
                height: 70,
                width: width,
                decoration: const BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(0, -1),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      // widget.provider.downloadFile(data.id, data.customerName);
                      launchUrl(
                          Uri.parse(
                              "https://zihun-cashier.xyz/api/transactions/${data.id}/print"),
                          mode: LaunchMode.externalApplication);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/printer.png",
                          width: 16,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Print Receipt",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: kPrimaryColor,
                        side: BorderSide(color: kCyan),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
