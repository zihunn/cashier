import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kasir/utils/dio_hendler.dart';

import '../utils/constant.dart';

class AuthRepository  {
  static Future register(Map<String, dynamic> requestBody) async {
    try {
      var res = await dio.post(
        'http://127.0.0.1:8000/api/register',
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
}
