import 'package:flutter/cupertino.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/model/table_model.dart';
import 'package:kasir/repository/table_respository.dart';

import '../utils/custom_snackbar.dart';
import '../utils/navigation_helper.dart';

class TableProvider extends ChangeNotifier {
  TableProvider() {
    notifyListeners();
    getTable();
    notifyListeners();
  }
  final repository = TableRepository();

  List<Meja>? listTable;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future getTable() async {
    _isLoading = true;
    var data = await TableRepository.geTable();
    notifyListeners();
    if (data is TableModel) {
      print(data.message);
      listTable = data.data;
    } else {
      notifyListeners();
      print(data);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getTable2() async {
    _isLoading = true;
    var data = await TableRepository.geTable();
    notifyListeners();
    if (data is TableModel) {
      print(data.message);
      listTable = data.data;
    } else {
      notifyListeners();
      print(data);
    }
    _isLoading = false;
    notifyListeners();
    goBack();
  }

  Future addTable(String number) async {
    var data = await TableRepository.addTable(number);
    notifyListeners();
    if (data is String) {
      notifyListeners();
    }
    notifyListeners();
  }

  Future deleteTable(String number) async {
    var data = await TableRepository.deleteTable(number);
    if (data is String) {
      notifyListeners();
      goBack();
    }
    notifyListeners();
  }
}
  


// class TableProvider extends ChangeNotifier {
//   TableProvider() {
//     notifyListeners();
//     getAllTable();
//   }
//   final repository = TableRepository();
//   List<TableModel> _listTable = [];
//   List<TableModel> get listTable => _listTable;

//   Future getAllTable() async {
//     final response = await repository.getAll();
//     notifyListeners();
//     _listTable = response;
//     print(_listTable);
//     notifyListeners();
//   }

//   Future deleteTable(String number) async {
//     final response = await repository.delete(number);
//     notifyListeners();
//   }

//   Future addTable(String number) async {
//     final response = await repository.add(number);
//     if (response is TableModel) {
//       successSnackBar(response.number);
//     } else {}
//     notifyListeners();
//   }
// }
