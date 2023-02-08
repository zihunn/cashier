import 'package:flutter/material.dart';
import 'package:kasir/view/dashboard_admin.dart';
import 'package:kasir/view/dashboard_cashier.dart';
import 'package:kasir/view/dashboard_owner.dart';
import 'package:kasir/view/dashboard_waiter.dart';
import 'package:kasir/view/login.dart';
import 'package:kasir/view/register.dart';
import 'utils/core/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Jakarta'),
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      home: DashboardCashierView(),
    );
  }
}