import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/lessonpage/widget_lessonpage/bottom_sheet_lesson.dart';
import 'package:crypto_app/page/lessonpage/widget_lessonpage/textfield_lessonpage.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonMainPage extends StatefulWidget {
  const LessonMainPage({super.key});

  @override
  State<LessonMainPage> createState() => _LessonMainPageState();
}

class _LessonMainPageState extends State<LessonMainPage> {
  final CollectionReference _lessonReference =
      FirebaseFirestore.instance.collection('Lesson');
  final TextEditingController textEditingController = TextEditingController();
  String search = "";
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
            onPressed: () => Navigator.pop(context),
          ),
          title: SizedBox(
            height: 40.h,
            child: TextField(
              controller: textEditingController,
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
                hintText: 'ค้นหาเนื้อหาและบทเรียน..',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  search = val.toLowerCase();
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot<Object?>>(
            stream: _lessonReference.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('No Data...'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.whiteColor,
                  ),
                );
              }
              List<DocumentSnapshot> items = snapshot.data!.docs;
              if (search.isNotEmpty) {
                items = items
                    .where((element) =>
                        element['name']
                            .toString()
                            .toLowerCase()
                            .contains(search) ||
                        element['content']
                            .toString()
                            .toLowerCase()
                            .contains(search))
                    .toList();
              }
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot item = items[index];

                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.overlayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: SizedBox(
                              width: 300.w,
                              child: Text(
                                item['name'],
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.network(
                                item['cover'],
                                width: index == 0 ? 400.w : 250.w,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: SizedBox(
                              width: 300.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.yellowColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return FractionallySizedBox(
                                        heightFactor: 0.95,
                                        child: BottomSheetLesson(
                                          item: item,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'อ่าน',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
