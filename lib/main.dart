import 'package:flutter/material.dart';
import 'package:kasir/provider/table_provider.dart';
import 'package:kasir/view/add_menu.dart';
import 'package:kasir/view/dashboard_admin.dart';
import 'package:kasir/view/dashboard_cashier.dart';
import 'package:kasir/view/dashboard_owner.dart';
import 'package:kasir/view/dashboard_waiter.dart';
import 'package:kasir/view/login.dart';
import 'package:kasir/view/register.dart';
import 'package:provider/provider.dart';
import 'utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TableProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Jakarta'),
        title: 'Cashier',
        navigatorKey: navigatorKey,
        home: LoginView(),
      ),
    );
  }
}
