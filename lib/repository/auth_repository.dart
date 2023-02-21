import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:kasir/utils/constant.dart';
import '../model/account_model.dart';
import '../utils/dio_hendler.dart';

class AuthRepository {
  static Future register(Map<String, dynamic> requestBody) async {
    try {
      var res = await dio.post(
        '$url/register',
        data: FormData.fromMap(requestBody),
      );
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return res.data;
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future login(Map<String, dynamic> requestBody) async {
    try {
      var res = await dio.post(
        '$url/login',
        data: FormData.fromMap(requestBody),
      );
      print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        var data = AccountModel.fromJson(res.data);
        print(data.account.name);
        return data;
      }
    } catch (e) {
      return null;
    }
  }

  static Future logout() async {
    try {
      var res = await dio.post(
        '$url/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $barrier',
            'Accept': 'application/json'
          },
        ),
      );
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return res.data;
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }
}




// class AuthRepository {
//   static Future register(Map<String, dynamic> requestBody) async {
//     try {
//       var res = await dio.post(
//         '$url/register',
//         data: FormData.fromMap(requestBody),
//       );
//       log(res.realUri.toString());
//       if (res.statusCode == 200) {
//         return res.data;
//       }
//     } on DioError catch (e) {
//       var error = DioHandler.parseDioErrorMessage(e);
//       return error;
//     } catch (e) {
//       return null;
//     }
//   }

//   static Future login(Map<String, dynamic> requestBody) async {
//     try {
//       var res = await dio.post(
//         '$url/login',
//         data: FormData.fromMap(requestBody),
//       );
//       log(res.realUri.toString());
//       if (res.statusCode == 200) {
//         return AccountModel.fromJson(res.data);
//       }
//     } on DioError catch (e) {
//       var error = DioHandler.parseDioErrorMessage(e);
//       return error;
//     } catch (e) {
//       return null;
//     }
//   }

//   static Future logout() async {
//     try {
//       var res = await dio.post(
//         '$url/logout',
//       );
//       log(res.realUri.toString());
//       if (res.statusCode == 200) {
//         return res.data;
//       }
//     } on DioError catch (e) {
//       var error = DioHandler.parseDioErrorMessage(e);
//       return error;
//     } catch (e) {
//       return null;
//     }
//   }
// }
