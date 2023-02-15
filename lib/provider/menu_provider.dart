import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasir/models/menu_model.dart';
import 'package:kasir/repository/menu_repository.dart';
import 'package:kasir/view/dashboard_admin.dart';

import '../utils/custom_snackbar.dart';
import '../utils/navigation_helper.dart';

class MenuProvider extends ChangeNotifier {
  MenuProvider() {
    getAllMenu();
    getDrink();
    getFood();
    getDessert();
  }

  final repository = MenuRepository();

  List<MenuModel> _allMenu = [];
  List<MenuModel> get allMenu => _allMenu;

  List<MenuModel> _drink = [];
  List<MenuModel> get drink => _drink;

  List<MenuModel> _food = [];
  List<MenuModel> get food => _food;

  List<MenuModel> _dessert = [];
  List<MenuModel> get dessert => _dessert;

  // Get All Menu
  Future<void> getAllMenu() async {
    final response = await repository.getAllMenu();
    _allMenu = response;
    notifyListeners();
  }

  // Get Drink
  Future getDrink() async {
    final response = await repository.getDrink();
    _drink = response;
    print(_drink);
    notifyListeners();
  }

  // Get Food
  Future getFood() async {
    final response = await repository.getFood();
    _food = response;
    print(_food);
    notifyListeners();
  }

  // Get Food
  Future getDessert() async {
    final response = await repository.getDessert();
    _dessert = response;
    print(_dessert);
    notifyListeners();
  }

  // Future addMenu(data) async {
  //   final response =
  //       await repository.addMenu(data);
  //   notifyListeners();
  // }
  Future addMenu(data) async {
    var res = await MenuRepository.addMenu(data);
    if (res['status'] == 200) {
      infoSnackBar("Berhasil Menambahkan Kelas");
      goRemove(DashboardAdminView());
      notifyListeners();
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }

  Future deleteMenu(String id) async {
    final response = await repository.deleteMenu(id);
    notifyListeners();
  }
}
