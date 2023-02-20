import 'package:flutter/material.dart';
import 'package:kasir/model/table_model.dart';
import 'package:kasir/provider/table_provider.dart';
import 'package:kasir/utils/constant.dart';
import 'package:kasir/utils/modal.dart';
import 'package:provider/provider.dart';
import '../repository/table_respository.dart';
import '../utils/color.dart';
import '../component/appbar.dart';
import '../component/dialogAddTable.dart';

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
        builder: (context, tableProv, child) {
          var listTable = tableProv.listTable;
          print(listTable);
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
                        dialogAddTable(tableProv);
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
                    child: tableProv.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: listTable?.length,
                            itemBuilder: (context, index) {
                              var item = listTable?[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Dismissible(
                                  background: Container(
                                    margin: EdgeInsets.symmetric(vertical: 6),
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Align(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                print(item);
                                              },
                                              icon: Image.asset(
                                                "assets/images/bin.png",
                                                width: 94.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text("Delete", style: titleStyle),
                                          ],
                                        ),
                                        alignment: Alignment.centerRight,
                                      ),
                                    ),
                                  ),
                                  direction: DismissDirection.endToStart,
                                  key: Key("${item?.number}"),
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
                                          'Table',
                                          style: titleStyle,
                                        ),
                                        subtitle: Text(
                                          "${item!.number}",
                                          style: subtitleStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction) async {
                                    await tableProv
                                        .deleteTable('${item.number}');
                                    tableProv.getTable();
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
