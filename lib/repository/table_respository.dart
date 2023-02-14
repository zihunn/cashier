import 'dart:convert';

import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:kasir/models/table_model.dart';
import 'package:kasir/utils/constant.dart';

class TableRepository {
  Future<List<TableModel>> getAll() async {
    var response = await http.get(
      Uri.parse('$url/tables'),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final data = json.map((e) {
        return TableModel(number: e['number']);
      }).toList();
      print(data);

      return data;
    }
    return [];
  }

  Future add(String number) async {
    try {
      final response =
          await http.post(Uri.parse('$url/tables'), body: {"number": number});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future delete(String number) async {
    try {
      final response = await http.delete(Uri.parse("$url/tables/$number"));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
