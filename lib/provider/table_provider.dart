import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kasir/models/table_model.dart';
import 'package:kasir/repository/table_respository.dart';
import 'package:kasir/utils/navigation_helper.dart';
import '../utils/custom_snackbar.dart';

class TableProvider extends ChangeNotifier {
  TableProvider() {
    notifyListeners();
    getAllTable();
  }
  final repository = TableRepository();
  List<TableModel> _listTable = [];
  List<TableModel> get listTable => _listTable;

  Future getAllTable() async {
    final response = await repository.getAll();
    notifyListeners();
    _listTable = response;
    print(_listTable);
    notifyListeners();
  }

  Future deleteTable(String number) async {
    final response = await repository.delete(number);
    notifyListeners();
  }

  Future addTable(String number) async {
    final response = await repository.add(number);
    if (response is TableModel) {
      successSnackBar(response.number);
    } else {}
    notifyListeners();
  }
}
