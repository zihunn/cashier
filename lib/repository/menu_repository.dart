import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:kasir/model/menu_model.dart';

import '../utils/constant.dart';
import '../utils/dio_hendler.dart';

class MenuRepository {
  // GET ALL MENU
  static Future getMenu() async {
    try {
      var res = await dio.get(
        '$url/menus',
      );
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

  // GET FOOD
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

  // DELETE MENU
  static Future deleteMenu(int id) async {
    try {
      var res = await dio.delete(
        '$url/menus',
        data: {'id': id},
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

  // CREATE MNEU
  static Future createMenu(Map<String, dynamic> requestBody) async {
    try {
      var res = await dio.post(
        '$url/menus',
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

  // EDIT MENU
  static Future editMenu(Map<String, dynamic> requestBody, int id) async {
    try {
      var res = await dio.post(
        '$url/menus/$id',
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

  static Future searchMenu(String keyword) async {
    try {
      var res = await dio
          .get('$url/menus/search', queryParameters: {'search': keyword});
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
}
