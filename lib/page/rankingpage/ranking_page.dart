import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/widget/bottom_nav.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/app_colors.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('Users');
  String search = "";
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String userId = firebaseAuth.currentUser!.uid;
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
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                text: 'แบบทดสอบที่1',
              ),
              Tab(
                text: 'แบบทดสอบที่2',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [page1(userId), page2(userId)],
        ),
      ),
    );
  }

  Column page1(String userId) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
                future: _userReference.doc(userId).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        'คุณ ${snapshot.data!['username']}',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18.sp,
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'คุณ Text',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  );
                }),
            SizedBox(
              width: 200.w,
              height: 40.h,
              child: TextField(
                cursorColor: AppColors.yellowColor,
                style: TextStyle(color: AppColors.yellowColor, fontSize: 14.sp),
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
                onChanged: (value) {
                  setState(() {
                    search = value.toLowerCase();
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        _headingTable(),
        StreamBuilder<QuerySnapshot<Object?>>(
            stream: _userReference
                .orderBy("userPoint1", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('ไม่พบผู้ใช้'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  ),
                );
              }
              List<DocumentSnapshot> items = snapshot.data!.docs;
              if (search.isNotEmpty) {
                items = items
                    .where((element) =>
                        element['username']
                            .toString()
                            .toLowerCase()
                            .contains(search) ||
                        element['userPoint1']
                            .toString()
                            .toLowerCase()
                            .contains(search))
                    .toList();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot item = items[index];
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
                                  item['username'],
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
                                  '${item['userPoint1']}',
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
              );
            })
      ],
    );
  }

  Column page2(String userId) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
                future: _userReference.doc(userId).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        'คุณ ${snapshot.data!['username']}',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18.sp,
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'คุณ Text',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  );
                }),
            SizedBox(
              width: 200.w,
              height: 40.h,
              child: TextField(
                cursorColor: AppColors.yellowColor,
                style: TextStyle(color: AppColors.yellowColor, fontSize: 14.sp),
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
                onChanged: (value) {
                  setState(() {
                    search = value.toLowerCase();
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        _headingTable(),
        StreamBuilder<QuerySnapshot<Object?>>(
            stream: _userReference
                .orderBy("userPoint2", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('ไม่พบผู้ใช้'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  ),
                );
              }
              List<DocumentSnapshot> items = snapshot.data!.docs;
              if (search.isNotEmpty) {
                items = items
                    .where((element) =>
                        element['username']
                            .toString()
                            .toLowerCase()
                            .contains(search) ||
                        element['userPoint2']
                            .toString()
                            .toLowerCase()
                            .contains(search))
                    .toList();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot item = items[index];
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
                                  item['username'],
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
                                  '${item['userPoint2']}',
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
              );
            })
      ],
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
