import 'dart:developer';

import 'package:crypto_app/models/login_model.dart';
import 'package:flutter/cupertino.dart';

class LoginBloc {
  String login(GlobalKey<FormState> globalFormKey, LoginModel loginModel) {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      log(loginModel.email);
      log(loginModel.password);
    }
    return "pass";
  }
}
