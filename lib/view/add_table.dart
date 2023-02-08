import 'package:flutter/material.dart';
import 'package:kasir/utils/core/color.dart';
import 'package:kasir/utils/core/navigation_helper.dart';

import '../widget/appbar.dart';
import '../widget/dialogAddTable.dart';

class AddTableView extends StatefulWidget {
  const AddTableView({Key? key}) : super(key: key);

  @override
  State<AddTableView> createState() => _AddTableViewState();
}

class _AddTableViewState extends State<AddTableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppbar(
          text: "Add New Table",
        ),
        preferredSize: const Size.fromHeight(60),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const DialogAddTableView());
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/dinner.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Add Table",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                    primary: kPrimaryColor,
                    side: BorderSide(color: kCyan),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/table.png",
                          width: 30,
                        ),
                        title: Text('Table 1'),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/delete-button.png",
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
