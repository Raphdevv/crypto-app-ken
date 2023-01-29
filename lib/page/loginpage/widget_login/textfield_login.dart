import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_colors.dart';

class TextFieldLogin extends StatelessWidget {
  final String topic;
  final String hint;
  const TextFieldLogin({super.key, required this.topic, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          topic,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          cursorColor: AppColors.primaryColor,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            prefixIcon: Icon(
              topic == 'อีเมล' ? Icons.email : Icons.lock,
              color: AppColors.primaryColor,
            ),
            focusColor: AppColors.primaryColor,
            fillColor: AppColors.greenColor,
            filled: true,
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ],
    );
  }
}
