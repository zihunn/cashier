import 'package:flutter/cupertino.dart';
import 'package:kasir/view/dashboard_admin.dart';
import 'package:kasir/view/dashboard_cashier.dart';
import 'package:kasir/view/dashboard_owner.dart';
import 'package:kasir/view/dashboard_waiter.dart';
import 'package:kasir/view/login.dart';

import '../models/account_model.dart';
import '../repository/auth_repository.dart';
import '../utils/custom_snackbar.dart';
import '../utils/navigation_helper.dart';
import '../utils/session_manager.dart';

class AuthProvider extends ChangeNotifier {
  Future register(Map<String, dynamic> requestBody) async {
    var data = await AuthRepository.register(requestBody);

    notifyListeners();
  }

  Future login(Map<String, dynamic> requestBody) async {
    var data = await AuthRepository.login(requestBody);
    print(data);
    if (data is AccountModel) {
      if (data.account.role == "admin") {
        goRemove(DashboardAdminView());
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
      successSnackBar(data.message);
    } else if (data is String) {
      goBack();
      errorSnackBar(data);
    } else {
      goBack();
      errorSnackBar("Something When Wrong!");
    }
    notifyListeners();
  }

  Future logout() async {
    var res = await AuthRepository.logout();
    if (res is String) {
      SessionManager.clearSession();
      goRemove(LoginView());
      errorSnackBar(res);
    } else if (res['success'] = true) {
      goBack();
      SessionManager.clearSession();
      goRemove(LoginView());
      infoSnackBar('Anda Telah Keluar');
    } else {
      errorSnackBar("Something when wrong!");
    }
    notifyListeners();
  }
}
