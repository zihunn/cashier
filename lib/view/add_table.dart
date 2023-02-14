import 'package:flutter/material.dart';
import 'package:kasir/component/table_component.dart';
import 'package:kasir/models/table_model.dart';
import 'package:kasir/provider/table_provider.dart';
import 'package:kasir/utils/constant.dart';
import 'package:provider/provider.dart';
import '../utils/color.dart';
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
    final color1 = [kSecondaryColor, kBlueSoft];

    return ChangeNotifierProvider(
      create: (_) => TableProvider(),
      child: Consumer<TableProvider>(
        builder: (context, value, child) {
          final tables = value.listTable;
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
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 26),
                          primary: kPrimaryColor,
                          side: BorderSide(color: kCyan),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: tables.length,
                        itemBuilder: (context, index) {
                          var item = tables[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Dismissible(
                              background: Container(
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Align(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        " Delete",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                              direction: DismissDirection.endToStart,
                              key: Key("${item.number}"),
                              child: Card(
                                color: color1[index % color1.length],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/table.png",
                                      width: 30,
                                    ),
                                    title: Text(
                                      "Table",
                                      style: titleStyle,
                                    ),
                                    subtitle: Text(
                                      "${item.number}",
                                      style: subtitleStyle,
                                    ),
                                  ),
                                ),
                              ),
                              onDismissed: (direction) {
                                TableProvider().deleteTable('${item.number}');
                              },
                            ),
                          );
                        },
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
