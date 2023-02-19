import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_colors.dart';
import '../../../dialog/dialog.dart';
import '../../../dialog/loader.dart';

class TestInfo extends StatefulWidget {
  const TestInfo({super.key});

  @override
  State<TestInfo> createState() => _TestInfoState();
}

class _TestInfoState extends State<TestInfo> {
  final controller = PageController(initialPage: 0);
  final Stream<DocumentSnapshot<Map<String, dynamic>>> testing =
      FirebaseFirestore.instance
          .collection('Testing')
          .doc('testinfo')
          .snapshots();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('Users');

  Map<String, dynamic> updatePoint = HashMap();

  List<int> sum = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'แบบทดสอบที่ 2',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: StreamBuilder(
            stream: testing,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.whiteColor,
                  ),
                );
              } else if (snapshot.data != null) {
                return PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    page(snapshot.data!['choice1']['image'],
                        snapshot.data!['choice1']['answer']),
                    page(snapshot.data!['choice2']['image'],
                        snapshot.data!['choice2']['answer']),
                    page(snapshot.data!['choice3']['image'],
                        snapshot.data!['choice3']['answer']),
                    page(snapshot.data!['choice4']['image'],
                        snapshot.data!['choice4']['answer']),
                    page(snapshot.data!['choice5']['image'],
                        snapshot.data!['choice5']['answer']),
                    page(snapshot.data!['choice6']['image'],
                        snapshot.data!['choice6']['answer']),
                    page(snapshot.data!['choice7']['image'],
                        snapshot.data!['choice7']['answer']),
                    page(snapshot.data!['choice8']['image'],
                        snapshot.data!['choice8']['answer']),
                    page(snapshot.data!['choice9']['image'],
                        snapshot.data!['choice9']['answer']),
                    page(snapshot.data!['choice10']['image'],
                        snapshot.data!['choice10']['answer']),
                    SizedBox(
                      width: 280.w,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        onPressed: () async {
                          DialogShowLoading().showLoaderDialog(context);
                          int s = 0;
                          String userId = firebaseAuth.currentUser!.uid;
                          DocumentReference documentReference =
                              _userReference.doc(userId);
                          for (var element in sum) {
                            s += element;
                          }
                          updatePoint.addAll({
                            "point2": FieldValue.arrayUnion([s]),
                            "testinfo": FieldValue.arrayUnion([s]),
                          });
                          await documentReference
                              .update(updatePoint)
                              .then((value) {
                            Navigator.pop(context);
                            DialogCrypto(context: context)
                                .showDialogPoint(text: s.toString());
                          });
                        },
                        child: Text(
                          'กดเพื่อส่งแบบทดสอบ',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              );
            }),
      ),
    );
  }

  Stack page(String img, String answer) {
    return Stack(
      children: [
        Image.network(
          img,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 150.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (answer == 'yes') {
                      sum.add(1);
                    } else {
                      sum.add(0);
                    }
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    log('$sum');
                  },
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (answer == 'no') {
                      sum.add(1);
                    } else {
                      sum.add(0);
                    }
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    log('$sum');
                  },
                  child: const Icon(
                    Icons.cancel_rounded,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
