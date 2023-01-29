import 'dart:developer';

import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/dialog/loader.dart';
import 'package:crypto_app/models/login_model.dart';
import 'package:crypto_app/services/firebase/fire_login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widget/bottom_nav.dart';

class LoginBloc {
  login(GlobalKey<FormState> globalFormKey, LoginModel loginModel, context) {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      DialogShowLoading().showLoaderDialog(context);
      FireLogin().checkLogin(loginModel).then((value) {
        Navigator.pop(context);
        if (value == 'เข้าสู่ระบบสำเร็จ') {
          log(value);
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
        } else {
          Fluttertoast.showToast(
            msg: value,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: AppColors.redColor,
            textColor: AppColors.primaryColor,
          );
        }
      });
    }
  }
}
