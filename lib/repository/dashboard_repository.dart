import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kasir/model/cart_model.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/utils/constant.dart';
import 'package:kasir/utils/dio_hendler.dart';

class DashboardRepository {
  static Future getByCategory(String data) async {
    try {
      var res =
          await dio.get('$url/menus', queryParameters: {'category': data});
      print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return MenuModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future addCarts(Map<String, dynamic> requestBody) async {
    try {
      var res = await dio.post(
        '$url/carts',
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
    static Future getCarts (String waiter) async {
    try {
      var res =
          await dio.get('$url/carts', queryParameters: {'waiter_id': waiter});
      print(res);
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return CartModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }
}
