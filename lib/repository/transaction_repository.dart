import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kasir/model/detail_model.dart';
import 'package:kasir/model/payment_model.dart';
import 'package:kasir/model/pending_model.dart';
import 'package:kasir/model/transaction_model.dart';
import 'package:kasir/utils/constant.dart';
import 'package:kasir/utils/dio_hendler.dart';

class TransactionRepository {
  static Future createTransaction(Map<String, dynamic> requestBody) async {
    try {
      var res = await dio.post(
        '$url/transactions',
        data: FormData.fromMap(requestBody),
      );
      print(res);
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

  static Future getHistoryPending(String status, String date) async {
    try {
      var res = await dio.get(
        '$url/transactions',
        queryParameters: {'status': status, 'date': date},
      );
      print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return PendingModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future getHistoryCompleted(String status, String date) async {
    try {
      var res = await dio.get(
        '$url/transactions',
        queryParameters: {'status': status, 'date': date},
      );
      print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return TransactionModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future getDatail(int id) async {
    try {
      var res = await dio.get('$url/transactions/$id');
      // print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return DetailModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future payment(
      int id, int cashier_id, String payment_method, int total) async {
    try {
      var res = await dio.post(
          '$url/transactions/$id/payment?cashier_id=$cashier_id&payment_method=$payment_method&payment=$total',
          data: {
            'id': id,
            'cashier_id': cashier_id,
            'payment_method': payment_method,
            'total': total
          });
      print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return PaymentModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }
   static Future downloadFile(int id, fileName, directory) async {
    String? progressString;
    try {
      var res = await dio.download('$url/transactions/$id/print', '${directory.path}/$fileName',
          onReceiveProgress: (rec, total) {
        progressString = "${((rec / total) * 100).toStringAsFixed(0)}%";
      });
      if (res.statusCode == 200) {
        if (progressString == "100%") {
          return progressString;
        }
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    }
  }
}
