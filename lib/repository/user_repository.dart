import 'dart:developer';
import 'package:dio/dio.dart';
import '../utils/constant.dart';
import '../utils/dio_hendler.dart';
import 'package:kasir/model/user_model.dart';

class UserRepository {
  static Future getUser() async {
    try {
      var res = await dio.get(
        '$url/users',
      );
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future deleteUser(int id) async {
    try {
      var res = await dio.delete(
        '$url/users/$id',
        // data: {'id': id},
      );
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }
}








// class UserRepository {
//   Future<List<UserModel>> getUser() async {
//     var response = await http.get(
//       Uri.parse('$url/users'),
//     );
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as List;
//       final data = json.map((e) {
//         return UserModel(
//             id: e["id"], name: e["name"], email: e["email"], role: e["role"]);
//       }).toList();
//       print(data);

//       return data;
//     }
//     return [];
//   }

//   Future delete(String id) async {
//     try {
//       final response = await http.delete(Uri.parse("$url/users/$id"));
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
