import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kasir/utils/log.dart';

class DioHandler {
  static BuildContext? context;

  static void setContext(BuildContext context) {
    DioHandler.context = context;
  }

  static String parseDioErrorMessage(DioError e) {
    if (e.response?.statusCode == 500) {
      return e.message;
    }
    String error;
    Log.http(e.response!, {});
    switch (e.type) {
      case DioErrorType.connectTimeout:
        error = "Request Connection Time Out";
        // TODO: Handle this case.
        break;
      case DioErrorType.sendTimeout:
        error = "Request Send Time Out";

        // TODO: Handle this case.
        break;
      case DioErrorType.receiveTimeout:
        error = "Request Receive Time Out";
        // TODO: Handle this case.
        break;
      case DioErrorType.response:
        error = e.response!.data['message'];
        // TODO: Handle this case.
        break;
      case DioErrorType.cancel:
        error = "Request Canceled";
        // TODO: Handle this case.
        break;
      case DioErrorType.other:
        error = "SocketException: OS Error: Connection refused";
        // TODO: Handle this case.
        break;
    }

    return error;
  }
}
