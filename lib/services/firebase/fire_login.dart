import 'dart:developer';

import 'package:crypto_app/models/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireLogin {
  Future<String> checkLogin(LoginModel loginModel) async {
    String message = '';
    // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      )
          .then((value) {
        message = 'เข้าสู่ระบบสำเร็จ';
      });
      return message;
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      if (e.message == 'wrong-password') {
        message = 'รหัสผ่านไม่ถูกต้อง';
      } else if (e.message == 'user-not-found') {
        message = "ไม่พบบัญชีผู้ใช้นี้";
      } else if (e.message ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        message = 'ไม่มีบันทึกผู้ใช้ที่สอดคล้องอีเมลนี้ ผู้ใช้อาจถูกลบไปแล้ว';
      }
      return message;
    }
  }
}
