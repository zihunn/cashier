import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kasir/models/table_model.dart';
import 'package:kasir/provider/table_provider.dart';
import 'package:kasir/repository/table_respository.dart';
import 'package:provider/provider.dart';
import "package:http/http.dart" as http;

class TableComponent extends StatefulWidget {
  const TableComponent({super.key});

  @override
  State<TableComponent> createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TableProvider(),
      child: Consumer<TableProvider>(
        builder: (context, value, child) {
          final tables = value.listTable;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: tables.length,
            itemBuilder: (context, index) {
              var item = tables[index];
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
                    title: Text("${item.number}"),
                    trailing: IconButton(
                      onPressed: () async {
                        TableProvider().deleteTable('${item.number}');
                      },
                      icon: Image.asset(
                        "assets/images/delete-button.png",
                        width: 25,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
