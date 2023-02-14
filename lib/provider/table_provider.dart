import 'package:flutter/cupertino.dart';
import 'package:kasir/models/table_model.dart';
import 'package:kasir/repository/table_respository.dart';
import 'package:kasir/utils/navigation_helper.dart';

class TableProvider extends ChangeNotifier {
  TableProvider() {
    getAllTable();
  }
  final repository = TableRepository();
  List<TableModel> _listTable = [];
  List<TableModel> get listTable => _listTable;

  Future<void> getAllTable() async {
    final response = await repository.getAll();
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

    goBack();
    notifyListeners();
  }
}
