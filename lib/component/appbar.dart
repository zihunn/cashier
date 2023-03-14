// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/navigation_helper.dart';

class CustomAppbar extends StatelessWidget {
  var text;

  CustomAppbar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        text,
        style: headingStyle.copyWith(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black87
              : Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          goBack();
        },
        icon: Image.asset(
          "assets/images/left.png",
          width: 30.0,
        ),
      ),
    );
  }
}
