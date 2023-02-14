// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:kasir/view/dashboard_admin.dart';
import 'package:kasir/view/dashboard_cashier.dart';

import '../utils/constant.dart';
import '../utils/navigation_helper.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      if (user!.role != "admin" && user!.role != "waiter") {
        goRemove(DashboardAdminView());
      } else {
        goRemove(DashboardCashierView());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
