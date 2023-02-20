
import 'package:kasir/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/account_model.dart';
import '../component/loading_screen.dart';
import 'navigation_helper.dart';

class SessionManager {
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Future setSession(Account user, String token) async {
    final session = await prefs;
    session.setString(
      "user",
      jsonEncode(user.toJson()),
    );
    session.setString(
      "token",
      token,
    );
    var tokens = session.getString("token");
    barrier = tokens;
  }

  static Future checkSession() async {
    final session = await prefs;
    var users = session.getString("user");
    var tokens = session.getString("token");
    if (users != null && tokens != null) {
      user = Account.fromJson(jsonDecode(users));
      barrier = tokens;
      goRemove(LoadingScreen());
    }
  }

  static Future clearSession() async {
    final session = await prefs;
    user = null;
    barrier = null;
    session.clear();
  }
}
