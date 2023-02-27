import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:kasir/model/detail_model.dart';
import 'package:kasir/model/payment_model.dart';
import 'package:kasir/model/pending_model.dart';
import 'package:kasir/model/transaction_model.dart';
import 'package:kasir/repository/transaction_repository.dart';
import 'package:kasir/utils/custom_snackbar.dart';
import 'package:kasir/utils/modal.dart';
import 'package:kasir/utils/navigation_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TransactionProvider extends ChangeNotifier {
  TransactionProvider() {
    notifyListeners();
    var date = DateTime.now();
    var date2 = date.toString().split(" ")[0];
    getHistoryPending("pending", date2);
    getHistoryCompleted("completed ", date2);
  }

  List<Completed>? completed = [];
  List<Datum>? pending = [];
  Payment? payments;
  Data? _details;
  Data? get details => _details;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool permissionGranted = false;

  Future getHistoryCompleted(String status, String date) async {
    _isLoading = true;
    var res = await TransactionRepository.getHistoryCompleted(status, date);
    notifyListeners();
    print(res);
    if (res is TransactionModel) {
      print(res.message);
      completed = res.data;
      print("completed");
    } else {
      notifyListeners();
      print("res");
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getHistoryPending(String status, String date) async {
    _isLoading = true;
    var res = await TransactionRepository.getHistoryPending(status, date);
    notifyListeners();
    if (res is PendingModel) {
      print(res.message);
      pending = res.data;
      print(pending);
    } else {
      notifyListeners();
      print("res");
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getDetail(int id) async {
    _isLoading = true;
    var res = await TransactionRepository.getDatail(id);
    print(res);
    if (res is DetailModel) {
      print(res.message);
      _details = res.data;
      _isLoading = false;
      print("details");
    } else {
      print("res");
    }
    _isLoading = false;
    notifyListeners();
  }

  Future payment(int id, int cashier_id, String payment_method, int total,
      double discount) async {
    _isLoading = true;
    var res = await TransactionRepository.payment(
        id, cashier_id, payment_method, total, discount);
    notifyListeners();
    if (res is PaymentModel) {
      print(res.message);
      payments = res.data;
    } else {
      notifyListeners();
      print(res);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      permissionGranted = true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      permissionGranted = false;
    }
  }

  Future downloadFile(int id, fileName) async {
    Directory? directory;
    getStoragePermission();
    directory = Directory('/storage/emulated/0/Documents');
    if (!await directory.exists()) {
      directory = await getExternalStorageDirectory();
    }
    // dialogLoading();
    var data = await TransactionRepository.downloadFile(
      id,
      fileName,
      directory,
    );
    print(data);
    if (data is DioError) {
      // goBack();
      errorSnackBar(data);
    } else {
      print(data);
      // goBack();
      infoSnackBar("File Telah Di Download");
    }
  }
}
