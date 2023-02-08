// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kasir/utils/core/color.dart';
import 'package:kasir/utils/core/constant.dart';
import 'package:kasir/widget/appbar.dart';

class EmployeView extends StatefulWidget {
  const EmployeView({Key? key}) : super(key: key);

  @override
  State<EmployeView> createState() => _EmployeViewState();
}

class _EmployeViewState extends State<EmployeView> {
  final _colors = [kSecondaryColor, kBlueSoft];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppbar(text: "Employee")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: kBlueSoft,
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
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/search.png",
                      width: 30.0,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: kBlueSoft,
                        hoverColor: Colors.transparent,
                        hintText: "Search",
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Card(
                    color: _colors[index % _colors.length],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/employee.png",
                        width: 40,
                      ),
                      title: Text(
                        "Bang Messi",
                        style: titleStyle,
                      ),
                      subtitle: Text(
                        "Programmer",
                        style: subtitleStyle,
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/trash.png",
                          width: 30.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
