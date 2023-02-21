import 'package:flutter/cupertino.dart';
import 'package:kasir/model/cart_model.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/model/table_model.dart';
import 'package:kasir/repository/dashboard_repository.dart';
import 'package:kasir/repository/table_respository.dart';
import 'package:kasir/utils/navigation_helper.dart';
import 'package:kasir/view/dashboard/dashboard_admin.dart';
import 'package:kasir/view/dashboard/dashboard_cashier.dart';
import 'package:kasir/view/dashboard/dashboard_owner.dart';
import 'package:kasir/view/dashboard/dashboard_waiter.dart';
import 'package:kasir/utils/custom_snackbar.dart';
import 'package:kasir/repository/auth_repository.dart';
import 'package:kasir/model/account_model.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardProvider() {
    getByCategory("food");
    init();
  }

  void init() {
    getTable();
  }

  List<Meja>? listTable;
  Account? list;
  Cart? listCart;
  List<Datum>? listMenu;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future login(Map<String, dynamic> requestBody) async {
    final data = await AuthRepository.login(requestBody);
    print(data);
    if (data is AccountModel) {
      list = data.account;
      print(list?.email);
      if (data.account.role == "admin") {
        goRemove(DashboardAdminView(
          data: list,
        ));
      }
      if (data.account.role == "waiter") {
        goRemove(DashboardWaiterVIew());
      }
      if (data.account.role == "cashier") {
        goRemove(DashboardCashierView());
      }
      if (data.account.role == "owner") {
        goRemove(DashboardOwnerView());
      }
      successSnackBar("berhasil");
    } else if (data is String) {
      goBack();
      errorSnackBar(data);
    } else {
      goBack();
      errorSnackBar("Something When Wrong!");
    }
  }

  Future getByCategory(String name) async {
    _isLoading = true;
    var res = await DashboardRepository.getByCategory(name);
    notifyListeners();
    if (res is MenuModel) {
      print(res.message);
      listMenu = res.data;
      print(listMenu);
    } else {
      notifyListeners();
      print(res);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future carts(String waiter) async {
    _isLoading = true;
    var res = await DashboardRepository.getCarts(waiter);
    notifyListeners();
    if (res is CartModel) {
      print(res.message);
      // listCart = res.;
      // print(listMenu);
    } else {
      notifyListeners();
      print(res);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getTable() async {
    _isLoading = true;
    var data = await TableRepository.geTable();
    notifyListeners();
    if (data is TableModel) {
      listTable = data.data;
      print(listTable);
    } else {
      notifyListeners();
      print(data);
    }
    _isLoading = false;
    notifyListeners();
  }
}
