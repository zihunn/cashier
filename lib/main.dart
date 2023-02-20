import 'package:flutter/material.dart';
import 'package:kasir/provider/menu_provider.dart';
import 'package:kasir/view/login.dart';
import 'package:kasir/view/menu/edit_menu.dart';
import 'package:provider/provider.dart';
import 'utils/constant.dart';
import 'view/dashboard/dashboard_admin.dart';

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
      title: 'Cashier',
      navigatorKey: navigatorKey,
      home: LoginView(),
    );
  }
}
