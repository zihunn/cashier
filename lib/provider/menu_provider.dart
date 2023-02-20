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
    var data = await MenuRepository.getMenu();
    notifyListeners();
    if (data is MenuModel) {
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
  // MenuProvider() {
  //   notifyListeners();
  //   getAllMenu();
  //   getDrink();
  //   getFood();
  //   getDessert();
  //   notifyListeners();
  // }

  // final repository = MenuRepository();
  // List<MenuModel> allMenu = [];
  // List<MenuModel> drink = [];
  // List<MenuModel> food = [];
  // List<MenuModel> dessert = [];

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;
  // set isLoading(bool val) {
  //   _isLoading = val;
  //   notifyListeners();
  // }

  // // Get All Menu
  // Future getAllMenu() async {
  //   final response = await repository.getAllMenu();
  //   notifyListeners();
  //   allMenu = response;
  //   print(allMenu);
  //   notifyListeners();
  // }

  // // Get Drink
  // Future getDrink() async {
  //   final response = await repository.getDrink();
  //   drink = response;
  //   print(drink);
  //   notifyListeners();
  // }

  // // Get Food
  // Future getFood() async {
  //   final response = await repository.getFood();
  //   food = response;
  //   print(food);
  //   notifyListeners();
  // }

  // // Get Food
  // Future getDessert() async {
  //   final response = await repository.getDessert();
  //   dessert = response;
  //   print(dessert);
  //   notifyListeners();
  // }

  // // Future addMenu(data) async {
  // //   final response =
  // //       await repository.addMenu(data);
  // //   notifyListeners();
  // // }
  // Future addMenu(data) async {
  //   final response = await repository.addMenu(data);
  //   if (response is MenuModel) {
  //     successSnackBar(response.name);
  //   } else {}
  // }

  // Future deleteMenu(String id) async {
  //   final response = await repository.deleteMenu(id);
  // }

  // // Future editMenu(int id, data) async {
  // //   final response = await repository.editMenu(id, data);
  // //   if (response is MenuModel) {
  // //     successSnackBar(response.name);
  // //   } else {}
  // //   notifyListeners();
  // // }
  // Future editMenu(int id, data) async {
  //   final response = await repository.editMenu(id, data);
  // }

