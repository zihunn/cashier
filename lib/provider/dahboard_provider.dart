import 'package:flutter/cupertino.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/repository/dashboard_repository.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardProvider() {
    getByCategory("food");
  }

  List<Datum>? listMenu;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
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
}
