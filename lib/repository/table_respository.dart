import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:kasir/model/table_model.dart';
import 'package:kasir/utils/constant.dart';

import '../utils/dio_hendler.dart';

class TableRepository {
  static Future geTable() async {
    try {
      var res = await dio.get(
        '$url/tables',
      );
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return TableModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future addTable(String number) async {
    try {
      var res = await dio.post('$url/tables', data: {"number": number});
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return TableModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future deleteTable(String number) async {
    try {
      var res =
          await dio.delete('$url/tables/$number', data: {'number': number});
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return res.data;
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }
}





// class TableRepository {
//   Future<List<TableModel>> getAll() async {
//     var response = await http.get(
//       Uri.parse('$url/tables'),
//     );
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as List;
//       final data = json.map((e) {
//         return TableModel(number: e['number']);
//       }).toList();
//       print(data);

//       return data;
//     }
//     return [];
//   }

//   Future add(String number) async {
//     try {
//       final response =
//           await http.post(Uri.parse('$url/tables'), body: {"number": number});

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future delete(String number) async {
//     try {
//       final response = await http.delete(Uri.parse("$url/tables/$number"));
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
