import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_colors.dart';

class TextFiedlLesson extends StatefulWidget {
  const TextFiedlLesson({super.key});

  @override
  State<TextFiedlLesson> createState() => _TextFiedlLessonState();
}

class _TextFiedlLessonState extends State<TextFiedlLesson> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          hintText: 'ค้นหาเนื้อหาและบทเรียน..',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
