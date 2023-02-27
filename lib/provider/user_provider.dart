import 'package:flutter/cupertino.dart';
import 'package:kasir/model/user_model.dart';
import 'package:kasir/repository/user_repository.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUser();
  }

  List<User>? listUser;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future getUser() async {
    _isLoading = true;
    var data = await UserRepository.getUser();
    notifyListeners();
    if (data is UserModel) {
      print(data.message);
      listUser = data.data;
    } else {
      notifyListeners();
      print(data);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future deleteUser(int id) async {
    var data = await UserRepository.deleteUser(id);
    if (data is String) {
      notifyListeners();
    }
    notifyListeners();
  }

  Future searachUser(String keyword) async {
    _isLoading = true;
    var res = await UserRepository.searchUser(keyword);
    notifyListeners();
    if (res is UserModel) {
      print(res.message);
      listUser = res.data;
      print(listUser);
    } else {
      notifyListeners();
      print(res);
    }
    _isLoading = false;
    notifyListeners();
  }
}
