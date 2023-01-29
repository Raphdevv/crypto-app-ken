import 'dart:developer';

import 'package:crypto_app/widget/bottom_nav.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/app_colors.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  List<Map<String, dynamic>> ranking = [
    {'point': 5, 'username': 'นาย A'},
    {'point': 15, 'username': 'นาย B'},
    {'point': 9, 'username': 'นาย C'},
  ];

  List<Map<String, dynamic>> listCopy = [];
  List<Map<String, dynamic>> _foundUser = [];

  @override
  void initState() {
    listCopy = List.of(ranking);
    listCopy.sort((a, b) {
      return (b['point']).compareTo(a['point']);
    });
    _foundUser = listCopy;
    super.initState();
  }

  _filter(String enterKey) {
    List<Map<String, dynamic>> result = [];
    if (enterKey.isEmpty) {
      result = listCopy;
    } else {
      result = listCopy
          .where((element) =>
              element['username']
                  .toString()
                  .toLowerCase()
                  .contains(enterKey.toLowerCase()) ||
              element['point']
                  .toString()
                  .toLowerCase()
                  .contains(enterKey.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUser = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 90.h,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: AppColors.yellowColor,
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNav(),
                  ),
                  (route) => false)),
          title: Text(
            'กระดานคะแนน',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 24.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: 200.w,
                height: 40.h,
                child: TextField(
                  cursorColor: AppColors.yellowColor,
                  style:
                      TextStyle(color: AppColors.yellowColor, fontSize: 14.sp),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.greenColor,
                    ),
                    focusColor: AppColors.yellowColor,
                    fillColor: AppColors.overlayColor,
                    filled: true,
                    hintText: 'ค้นหาผู้ใช้',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  onChanged: (value) => _filter(value),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            _headingTable(),
            Expanded(
              child: ListView.builder(
                itemCount: _foundUser.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                      width: double.infinity,
                      color: index % 2 == 0
                          ? AppColors.yellowColor
                          : AppColors.overlayColor,
                      child: Table(
                        children: [
                          TableRow(children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: index % 2 == 0
                                      ? AppColors.primaryColor
                                      : AppColors.whiteColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                _foundUser[index]['username'],
                                style: TextStyle(
                                  color: index % 2 == 0
                                      ? AppColors.primaryColor
                                      : AppColors.whiteColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '${_foundUser[index]['point']}',
                                style: TextStyle(
                                  color: index % 2 == 0
                                      ? AppColors.primaryColor
                                      : AppColors.whiteColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _headingTable() {
    return Container(
      width: double.infinity,
      color: AppColors.greenColor,
      child: Table(
        children: [
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                'อันดับ',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                'ชื่อผู้ใช้',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                'คะแนน',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
