import 'dart:developer';
import 'package:dio/dio.dart';

class Log {
  static const app = "ARSIPEDIA";
  static bool isLogBody = false;

  static v(String message) {
    log(message, time: DateTime.now(), name: app);
  }

  static e(String label, [dynamic error]) {
    log('', time: DateTime.now(), name: app, error: "[ERROR] $label");
    log('', time: DateTime.now(), name: app, error: "[ERROR] $error");
  }

  static http(Response response, Map params) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      log('HTTP   : ${response.realUri}', time: DateTime.now(), name: app);
      log('Status : ${response.statusCode} | ${response.statusMessage}',
          time: DateTime.now(), name: app);
      if (params != null)
        log('Request  => $params', time: DateTime.now(), name: app);
      if (isLogBody)
        log('Response => ${response.data}', time: DateTime.now(), name: app);
    } else {
      log('',
          time: DateTime.now(),
          name: app,
          error: '[ERROR] HTTP   : ${response.realUri}');
      log('',
          time: DateTime.now(),
          name: app,
          error:
              '[ERROR] Status : ${response.statusCode} | ${response.statusMessage} | ${response.requestOptions.method}');
      if (params != null)
        log('',
            time: DateTime.now(),
            name: app,
            error: '[ERROR] Request  => $params');
      log('',
          time: DateTime.now(),
          name: app,
          error: '[ERROR] Response => ${response.data}');
    }
  }
}
