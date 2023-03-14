import 'package:flutter/material.dart';
import 'package:kasir/provider/dashboard_provider.dart';
import 'package:kasir/view/authentication/login.dart';
import 'package:kasir/view/authentication/test.dart';
import 'package:provider/provider.dart';

import 'utils/constant.dart';

void main() {
  runApp(ChangeNotifierProvider<DashboardProvider>(
      create: (_) => DashboardProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: value.themeMode,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Jakarta'),
          title: 'Cashier',
          navigatorKey: navigatorKey,
          home: FirstPage(),
        );
      },
    );
  }
}
