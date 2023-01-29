import 'dart:developer';

import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/dialog/dialog.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:collection/collection.dart';

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
  List<Map<String, dynamic>> test1 = [];
  List<Map<String, dynamic>> test2 = [];
  List<Map<String, dynamic>> test3 = [];
  List<List<int>> sum1 = [];
  List<List<int>> sum2 = [];
  List<List<int>> sum3 = [];
  int g = 0;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
    for (var i = 0; i < 5; i++) {
      sum1.add([
        0,
        0,
        0,
        0,
      ]);
      test1.add({
        'proposition': 'โจทย์',
        'g': 0,
        'choice': [
          {
            'anwser': 1,
            'c': 'mock1',
          },
          {
            'anwser': 0,
            'c': 'mock1',
          },
          {
            'anwser': 0,
            'c': 'mock1',
          },
          {
            'anwser': 0,
            'c': 'mock1',
          },
        ],
        'check': false,
      });
      sum2.add([
        0,
        0,
        0,
        0,
      ]);
      test2.add({
        'proposition': 'โจทย์',
        'g': 0,
        'choice': [
          {
            'anwser': 0,
            'c': 'mock2',
          },
          {
            'anwser': 1,
            'c': 'mock2',
          },
          {
            'anwser': 0,
            'c': 'mock2',
          },
          {
            'anwser': 0,
            'c': 'mock2',
          },
        ],
        'check': false,
      });
      sum3.add([
        0,
        0,
        0,
        0,
      ]);
      test3.add({
        'proposition': 'โจทย์',
        'g': 0,
        'choice': [
          {
            'anwser': 0,
            'c': 'mock3',
          },
          {
            'anwser': 0,
            'c': 'mock3',
          },
          {
            'anwser': 0,
            'c': 'mock3',
          },
          {
            'anwser': 1,
            'c': 'mock3',
          },
        ],
        'check': false,
      });
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
            'แบบทดสอบ',
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
              Tab(
                text: 'ส่วนที่3',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            testViewOne(test1, test1.length),
            testViewTwo(test2, test2.length),
            testViewThree(test3, test3.length)
          ],
        ),
      ),
    );
  }

  Widget testViewOne(List<Map<String, dynamic>> test, int length) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
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
                      test[index]['proposition'],
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
    );
  }

  Widget radioButtonViewOne(
      Map<String, dynamic> text, int index1, int index2, int value) {
    return ListTile(
      title: Text(
        text['choice'][index2]['c'],
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      leading: Radio(
        fillColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.yellowColor;
        }),
        value: value,
        groupValue: text['g'],
        onChanged: (value) {
          if (index1 == 4) {
            setState(() {
              view1 = true;
              tabController.index = 1;
            });
          }
          int v = text['choice'][index2]['anwser'];
          setState(() {
            text['g'] = value!;
            if (v == 1) {
              sum1[index1][0] = v;
            } else {
              sum1[index1][0] = 0;
            }
          });
          log(sum1.toString());
        },
      ),
    );
  }

  Widget testViewTwo(List<Map<String, dynamic>> test, int length) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
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
                      test[index]['proposition'],
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
    );
  }

  Widget radioButtonViewTwo(
      Map<String, dynamic> text, int index1, int index2, int value) {
    return ListTile(
      title: Text(
        text['choice'][index2]['c'],
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      leading: Radio(
        fillColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.yellowColor;
        }),
        value: value,
        groupValue: text['g'],
        onChanged: (value) {
          if (index1 == 4) {
            setState(() {
              view2 = true;
              tabController.index = 2;
            });
          }
          int v = text['choice'][index2]['anwser'];
          setState(() {
            text['g'] = value!;
            if (v == 1) {
              sum2[index1][0] = v;
            } else {
              sum2[index1][0] = 0;
            }
          });
          log(sum2.toString());
        },
      ),
    );
  }

  Widget testViewThree(List<Map<String, dynamic>> test, int length) {
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
                            test[index]['proposition'],
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          radioButtonViewThree(test[index], index, 0, 1),
                          radioButtonViewThree(test[index], index, 1, 2),
                          radioButtonViewThree(test[index], index, 2, 3),
                          radioButtonViewThree(test[index], index, 3, 4),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          view3
              ? SizedBox(
                  height: 10.h,
                )
              : Container(),
          view3
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
                      int sum = 0;
                      var temp1 = sum1.expand((x) => x).toList();
                      var temp2 = sum2.expand((x) => x).toList();
                      var temp3 = sum3.expand((x) => x).toList();
                      sum += temp1.sum;
                      sum += temp2.sum;
                      sum += temp3.sum;
                      DialogCrypto(context: context)
                          .showDialogPoint(text: sum.toString());
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
          view3
              ? SizedBox(
                  height: 10.h,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget radioButtonViewThree(
      Map<String, dynamic> text, int index1, int index2, int value) {
    return ListTile(
      title: Text(
        text['choice'][index2]['c'],
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      leading: Radio(
        fillColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.yellowColor;
        }),
        value: value,
        groupValue: text['g'],
        onChanged: (value) {
          if (index1 == 4) {
            setState(() {
              view3 = true;
            });
          }
          int v = text['choice'][index2]['anwser'];
          setState(() {
            text['g'] = value!;
            if (v == 1) {
              sum3[index1][0] = v;
            } else {
              sum3[index1][0] = 0;
            }
          });
          log(sum3.toString());
        },
      ),
    );
  }
}
