import 'package:flutter/material.dart';
import 'package:kasir/view/authentication/login.dart';

import 'utils/constant.dart';

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
