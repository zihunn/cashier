import 'package:flutter/cupertino.dart';
import 'package:kasir/models/user_model.dart';
import 'package:kasir/repository/user_repository.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUser();
  }

  final repository = UserRepository();
  List<UserModel> _listUser = [];
  List<UserModel> get listUser => _listUser;

  Future<void> getUser() async {
    final response = await repository.getUser();
    _listUser = response;
    print(_listUser);
    notifyListeners();
  }

   Future<void> deleteUser(String id) async {
    final response = await repository.delete(id);
    notifyListeners();
  }
}
