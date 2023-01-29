import 'dart:developer';

import 'package:crypto_app/dialog/loader.dart';
import 'package:crypto_app/models/registor_model.dart';
import 'package:crypto_app/services/firebase/fire_registor.dart';
import 'package:crypto_app/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../const/app_colors.dart';

class RegistorBloc {
  registor(GlobalKey<FormState> globalFormKey, RegistorModel registorModel,
      context) {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      DialogShowLoading().showLoaderDialog(context);
      FireRegistor().registorFirebase(registorModel).then((value) {
        Navigator.pop(context);
        globalFormKey.currentState!.reset();
        log(value);
        if (value == 'สร้างบัญชีสำเร็จ') {
          Fluttertoast.showToast(
              msg: value,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: AppColors.greenColor,
              textColor: AppColors.primaryColor);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNav(),
            ),
            (route) => false,
          );
        }
      });
    }
  }
}
