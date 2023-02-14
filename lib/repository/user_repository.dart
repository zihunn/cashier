import 'dart:convert';

import 'package:kasir/models/user_model.dart';
import "package:http/http.dart" as http;

import '../utils/constant.dart';

class UserRepository {
  Future<List<UserModel>> getUser() async {
    var response = await http.get(
      Uri.parse('$url/users'),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final data = json.map((e) {
        return UserModel(
            id: e["id"], name: e["name"], email: e["email"], role: e["role"]);
      }).toList();
      print(data);

      return data;
    }
    return [];
  }

  Future delete(String id) async {
    try {
      final response = await http.delete(Uri.parse("$url/users/$id"));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
