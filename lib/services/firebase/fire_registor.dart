import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/models/registor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireRegistor {
  Future<String> registorFirebase(RegistorModel registorModel) async {
    Map<String, dynamic> users = HashMap();
    String message = 'สร้างบัญชีสำเร็จ';
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    CollectionReference userReference =
        FirebaseFirestore.instance.collection('Users');
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: registorModel.email,
        password: registorModel.password,
      );
      String userId = firebaseAuth.currentUser!.uid;
      DocumentReference documentReference = userReference.doc(userId);
      users.addAll({
        'username': registorModel.username,
        'email': registorModel.email,
        'password': registorModel.password,
        'testing': [],
        'testinfo': [],
        'point1': [],
        'point2': [],
      });
      documentReference.set(users).then((value) {
        message = 'สร้างบัญชีสำเร็จ';
        return message;
      });
      return message;
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      if (e.message ==
          'The email address is already in use by another account.') {
        message = 'อีเมลนี้ถูกใช้งานแล้ว';
      }
      return message;
    }
  }
}
