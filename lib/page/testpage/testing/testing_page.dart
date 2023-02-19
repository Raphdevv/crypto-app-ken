import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/dialog/dialog.dart';
import 'package:crypto_app/dialog/loader.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool view1 = false;
  bool view2 = false;
  bool view3 = false;
  bool checkTap = false;
  List<dynamic> test1 = [];
  List<dynamic> test2 = [];
  List<List<int>> sum1 = [];
  List<List<int>> sum2 = [];
  List<List<int>> g1 = [];
  List<List<int>> g2 = [];
  final Stream<DocumentSnapshot<Map<String, dynamic>>> testing =
      FirebaseFirestore.instance.collection('Testing').doc('tests').snapshots();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('Users');

  Map<String, dynamic> updatePoint = HashMap();

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
    for (var i = 0; i < 5; i++) {
      sum1.add([0]);
      sum2.add([0]);
      g1.add([0]);
      g2.add([0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'แบบทดสอบที่ 1',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 24.sp,
            ),
          ),
          bottom: TabBar(
            onTap: (value) {
              if (view1 == false && value == 1) {
                DialogCrypto(context: context).showDialogTesting(
                  text: 'กรุณาทำส่วนที่ 1 ให้เสร็จก่อน',
                  voidCallback: () {
                    Navigator.pop(context);
                    tabController.index = 0;
                  },
                );
              } else if (view1 == false && value == 2) {
                DialogCrypto(context: context).showDialogTesting(
                  text: 'กรุณาทำส่วนที่ 1 ให้เสร็จก่อน',
                  voidCallback: () {
                    Navigator.pop(context);
                    tabController.index = 0;
                  },
                );
              } else if (view2 == false && value == 2) {
                DialogCrypto(context: context).showDialogTesting(
                  text: 'กรุณาทำส่วนที่ 2 ให้เสร็จก่อน',
                  voidCallback: () {
                    Navigator.pop(context);
                    tabController.index = 1;
                  },
                );
              }
            },
            controller: tabController,
            tabs: const [
              Tab(
                text: 'ส่วนที่1',
              ),
              Tab(
                text: 'ส่วนที่2',
              ),
            ],
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
                test1 = snapshot.data!['q1'];
                test2 = snapshot.data!['q2'];
                return TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    testViewOne(test1, test1.length),
                    testViewTwo(test2, test2.length),
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

  Widget testViewOne(List<dynamic> test, int length) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.overlayColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            test[index]['problem'],
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          radioButtonViewOne(test[index], index, 0, 1),
                          radioButtonViewOne(test[index], index, 1, 2),
                          radioButtonViewOne(test[index], index, 2, 3),
                          radioButtonViewOne(test[index], index, 3, 4),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          view1
              ? SizedBox(
                  height: 10.h,
                )
              : Container(),
          view1
              ? SizedBox(
                  width: 280.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        tabController.index = 1;
                      });
                    },
                    child: Text(
                      'หน้าถัดไป',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                )
              : Container(),
          view1
              ? SizedBox(
                  height: 10.h,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget radioButtonViewOne(
      Map<String, dynamic> text, int index1, int index2, int value) {
    return ListTile(
      title: Text(
        text['Choices'][index2]['choice'],
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      leading: Radio(
        fillColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.yellowColor;
        }),
        value: value,
        groupValue: g1[index1][0],
        onChanged: (value) {
          if (index1 == 4) {
            setState(() {
              view1 = true;
            });
          }
          int v = text['Choices'][index2]['point'];
          setState(() {
            g1[index1][0] = value!;
            if (v == 1) {
              sum1[index1][0] = v;
              log(sum1.toString());
            } else {
              sum1[index1][0] = 0;
              log(sum1.toString());
            }
          });
        },
      ),
    );
  }

  Widget testViewTwo(List<dynamic> test, int length) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.overlayColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            test[index]['problem'],
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          radioButtonViewTwo(test[index], index, 0, 1),
                          radioButtonViewTwo(test[index], index, 1, 2),
                          radioButtonViewTwo(test[index], index, 2, 3),
                          radioButtonViewTwo(test[index], index, 3, 4),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          view2
              ? SizedBox(
                  height: 10.h,
                )
              : Container(),
          view2
              ? SizedBox(
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
                      int sum = 0;
                      String userId = firebaseAuth.currentUser!.uid;
                      DocumentReference documentReference =
                          _userReference.doc(userId);
                      var temp1 = sum1.expand((x) => x).toList();
                      var temp2 = sum2.expand((x) => x).toList();
                      log('temp1 : ${temp1.toString()}');
                      log('temp2 : ${temp2.toString()}');
                      for (var element in temp1) {
                        sum += element;
                      }
                      for (var element in temp2) {
                        sum += element;
                      }
                      updatePoint.addAll({
                        "point1": FieldValue.arrayUnion([sum]),
                        "testing": FieldValue.arrayUnion([sum]),
                      });
                      await documentReference.update(updatePoint).then((value) {
                        Navigator.pop(context);
                        DialogCrypto(context: context)
                            .showDialogPoint(text: sum.toString());
                      });
                    },
                    child: Text(
                      'ส่งแบบทดสอบ',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                )
              : Container(),
          view2
              ? SizedBox(
                  height: 10.h,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget radioButtonViewTwo(
      Map<String, dynamic> text, int index1, int index2, int value) {
    return ListTile(
      title: Text(
        text['Choices'][index2]['choice'],
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      leading: Radio(
        fillColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.yellowColor;
        }),
        value: value,
        groupValue: g2[index1][0],
        onChanged: (value) {
          if (index1 == 4) {
            setState(() {
              view2 = true;
            });
          }
          int v = text['Choices'][index2]['point'];
          setState(() {
            g2[index1][0] = value!;
            if (v == 1) {
              sum2[index1][0] = v;
              log(sum2.toString());
            } else {
              sum2[index1][0] = 0;
              log(sum2.toString());
            }
          });
        },
      ),
    );
  }

  // Widget testViewThree(List<dynamic> test, int length) {
  //   return Scaffold(
  //     backgroundColor: Colors.transparent,
  //     body: Column(
  //       children: [
  //         Expanded(
  //           child: ListView.builder(
  //             itemCount: length,
  //             itemBuilder: (context, index) {
  //               return Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Container(
  //                   width: double.infinity,
  //                   decoration: BoxDecoration(
  //                     color: AppColors.overlayColor,
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(20),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           test[index]['problem'],
  //                           style: TextStyle(
  //                               color: AppColors.whiteColor, fontSize: 18.sp),
  //                         ),
  //                         SizedBox(
  //                           height: 10.h,
  //                         ),
  //                         radioButtonViewThree(test[index], index, 0, 1),
  //                         radioButtonViewThree(test[index], index, 1, 2),
  //                         radioButtonViewThree(test[index], index, 2, 3),
  //                         radioButtonViewThree(test[index], index, 3, 4),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //         view3
  //             ? SizedBox(
  //                 height: 10.h,
  //               )
  //             : Container(),
  //         view3
  //             ? SizedBox(
  //                 width: 280.w,
  //                 height: 50.h,
  //                 child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: AppColors.yellowColor,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(20.r),
  //                     ),
  //                   ),
  //                   onPressed: () async {
  //                     DialogShowLoading().showLoaderDialog(context);
  //                     int sum = 0;
  //                     String userId = firebaseAuth.currentUser!.uid;
  //                     DocumentReference documentReference =
  //                         _userReference.doc(userId);
  //                     var temp1 = sum1.expand((x) => x).toList();
  //                     var temp2 = sum2.expand((x) => x).toList();
  //                     log('temp1 : ${temp1.toString()}');
  //                     log('temp2 : ${temp2.toString()}');
  //                     for (var element in temp1) {
  //                       sum += element;
  //                     }
  //                     for (var element in temp2) {
  //                       sum += element;
  //                     }

  //                     updatePoint.addAll({"userPoint": sum});
  //                     await documentReference.update(updatePoint).then((value) {
  //                       Navigator.pop(context);
  //                       DialogCrypto(context: context)
  //                           .showDialogPoint(text: sum.toString());
  //                     });
  //                   },
  //                   child: Text(
  //                     'ส่งแบบทดสอบ',
  //                     style: TextStyle(
  //                       color: AppColors.primaryColor,
  //                       fontSize: 18.sp,
  //                     ),
  //                   ),
  //                 ),
  //               )
  //             : Container(),
  //         view3
  //             ? SizedBox(
  //                 height: 10.h,
  //               )
  //             : Container(),
  //       ],
  //     ),
  //   );
  // }

  // Widget radioButtonViewThree(
  //     Map<String, dynamic> text, int index1, int index2, int value) {
  //   return ListTile(
  //     title: Text(
  //       text['Choices'][index2]['choice'],
  //       style: const TextStyle(
  //         color: AppColors.whiteColor,
  //       ),
  //     ),
  //     leading: Radio(
  //       fillColor: MaterialStateProperty.resolveWith((states) {
  //         return AppColors.yellowColor;
  //       }),
  //       value: value,
  //       groupValue: g3[index1][0],
  //       onChanged: (value) {
  //         if (index1 == 4) {
  //           setState(() {
  //             view3 = true;
  //           });
  //         }
  //         int v = text['Choices'][index2]['point'];
  //         setState(() {
  //           g3[index1][0] = value!;
  //           if (v == 1) {
  //             sum3[index1][0] = v;
  //             log(sum3.toString());
  //           } else {
  //             sum3[index1][0] = 0;
  //             log(sum3.toString());
  //           }
  //         });
  //       },
  //     ),
  //   );
  // }
}
