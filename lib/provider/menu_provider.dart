import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasir/models/menu_model.dart';
import 'package:kasir/repository/menu_repository.dart';
import 'package:kasir/utils/navigation_helper.dart';
import '../utils/custom_snackbar.dart';

class MenuProvider extends ChangeNotifier {
  MenuProvider() {
    notifyListeners();
    getAllMenu();
    getDrink();
    getFood();
    getDessert();
    notifyListeners();
  }
  bool _isLoading = false;

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
  Future getAllMenu() async {
    final response = await repository.getAllMenu();
    notifyListeners();
    _allMenu = response;
    print(_allMenu);
    notifyListeners();
  }

  Future getAllMenu2() async {
    final response = await repository.getAllMenu();
    _isLoading = false;
    _allMenu = response;
    print(_allMenu);
    notifyListeners();
    goBack();
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
    final response = await repository.addMenu(data);
    if (response is MenuModel) {
      successSnackBar(response.name);
    } else {}
  }

  Future deleteMenu(String id) async {
    final response = await repository.deleteMenu(id);
  }

  Future editMenu(String id, data) async {
    final response = await repository.editMenu(id, data);
    notifyListeners();
    if (response is MenuModel) {
      notifyListeners();
      successSnackBar(response.name);
    } else {}
    notifyListeners();
  }
}
