import 'package:flutter/cupertino.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/utils/modal.dart';
import 'package:kasir/utils/session_manager.dart';
import 'package:kasir/view/dashboard/dashboard_admin.dart';
import 'package:kasir/view/dashboard/dashboard_cashier.dart';
import 'package:kasir/view/dashboard/dashboard_owner.dart';
import 'package:kasir/view/dashboard/dashboard_waiter.dart';
import 'package:kasir/view/login.dart';
import '../repository/auth_repository.dart';
import 'package:kasir/utils/custom_snackbar.dart';

import '../utils/navigation_helper.dart';

class AuthProvider extends ChangeNotifier {
  Account? list;
  Future register(Map<String, dynamic> requestBody) async {
    dialogLoading();
    var data = await AuthRepository.register(requestBody);
    if (data['message'] == "Registrasi Berhasil") {
      successSnackBar(data['message']);
      goBack();
      goBack();
    } else if (data['message'] == "Username sudah digunakan") {
      goBack();
      errorSnackBar(data['message']);
    } else {
      goBack();
      errorSnackBar(data);
    }
    notifyListeners();
  }

  Future login(Map<String, dynamic> requestBody) async {
    final data = await AuthRepository.login(requestBody);
    print(data);
    if (data is AccountModel) {
      list = data.account;
      print(list);
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
      successSnackBar("berhasil");
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
    dialogLoading();
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












// class AuthProvider extends ChangeNotifier {
//   Future register(Map<String, dynamic> requestBody) async {
//     var data = await AuthRepository.register(requestBody);

//     notifyListeners();
//   }

//   Future login(Map<String, dynamic> requestBody) async {
//     var data = await AuthRepository.login(requestBody);
//     print(data);
//     if (data is AccountModel) {
//       if (data.account.role == "admin") {
//         goRemove(DashboardAdminView());
//       }
//       if (data.account.role == "waiter") {
//         goRemove(DashboardWaiterVIew());
//       }
//       if (data.account.role == "cashier") {
//         goRemove(DashboardCashierView());
//       }
//       if (data.account.role == "owner") {
//         goRemove(DashboardOwnerView());
//       }
//       successSnackBar(data.message);
//     } else if (data is String) {
//       goBack();
//       errorSnackBar(data);
//     } else {
//       goBack();
//       errorSnackBar("Something When Wrong!");
//     }
//     notifyListeners();
//   }

//   Future logout() async {
//     var res = await AuthRepository.logout();
//     if (res is String) {
//       goRemove(LoginView());
//       errorSnackBar(res);
//     } else if (res['success'] = true) {
//       goBack();
//       goRemove(LoginView());
//       infoSnackBar('Anda Telah Keluar');
//     } else {
//       errorSnackBar("Something when wrong!");
//     }
//     notifyListeners();
//   }
// }
