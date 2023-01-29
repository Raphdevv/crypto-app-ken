import 'dart:developer';

import 'package:crypto_app/models/registor_model.dart';
import 'package:flutter/cupertino.dart';

class RegistorBloc {
  registor(GlobalKey<FormState> globalFormKey, RegistorModel registorModel) {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      log(registorModel.email);
      log(registorModel.username);
      log(registorModel.password);
      log(registorModel.passwordCon);
    }
    return "pass";
  }
}
