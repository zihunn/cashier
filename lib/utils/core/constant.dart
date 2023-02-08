import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

double width = MediaQuery.of(navigatorKey.currentContext!).size.width;

double height = MediaQuery.of(navigatorKey.currentContext!).size.height;

double top = MediaQuery.of(navigatorKey.currentContext!).padding.top;

double size = MediaQuery.of(navigatorKey.currentContext!).size.width;

final myAppBar = AppBar();

final bodyHeight = height - myAppBar.preferredSize.height - top;

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  );
}
