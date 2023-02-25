import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/repository/menu_repository.dart';

import '../utils/custom_snackbar.dart';
import '../utils/modal.dart';

class MenuProvider extends ChangeNotifier {
  MenuProvider() {
    notifyListeners();
    getMenu();
  }

  List<Datum>? listMenu;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // GET ALL MENU
  Future getMenu() async {
    _isLoading = true;
    notifyListeners();
    var data = await MenuRepository.getMenu();
    notifyListeners();
    if (data is MenuModel) {
      notifyListeners();
      print(data.message);
      listMenu = data.data;
      print(listMenu);
    } else {
      notifyListeners();
      print(data);
    }
    _isLoading = false;
    notifyListeners();
  }

  // DELETE MENU
  Future deleteMenu(int id) async {
    var data = await MenuRepository.deleteMenu(id);
    if (data) {
      errorSnackBar(data);
    } else if (data['success'] = true) {
      infoSnackBar(data['message']);
    }
  }

  // ADD MENU
  Future addMenu(Map<String, dynamic> requestBody) async {
    var data = await MenuRepository.createMenu(requestBody);
    if (data is String) {
    } else if (data['success'] = true) {
      notifyListeners();
    } else {
      // goBack();
      errorSnackBar(data['message']);
    }
    notifyListeners();
  }

  // EDIT MENU
  Future editMenu(Map<String, dynamic> requestBody, int id) async {
    var res = await MenuRepository.editMenu(requestBody, id);
    notifyListeners();
  }

  notifyListeners();
}

