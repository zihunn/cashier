import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kasir/utils/dio_hendler.dart';
import "package:http/http.dart" as http;
import '../models/account_model.dart';
import '../utils/constant.dart';

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
      log(res.realUri.toString());
      if (res.statusCode == 200) {
        return AccountModel.fromJson(res.data);
      }
    } on DioError catch (e) {
      var error = DioHandler.parseDioErrorMessage(e);
      return error;
    } catch (e) {
      return null;
    }
  }

  static Future logout() async {
    try {
      var res = await dio.post(
        '$url/logout',
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
