import 'package:flutter/cupertino.dart';

import '../repository/auth_repository.dart';
import '../utils/custom_snackbar.dart';
import '../utils/navigation_helper.dart';

class AuthProvider extends ChangeNotifier {
  Future register(Map<String, dynamic> requestBody) async {
    var data = await AuthRepository.register(requestBody);
    if (data == "Registrasi Berhasil") {
      successSnackBar(data['message']);
      goBack();
      goBack();
    }
    notifyListeners();
  }
}
