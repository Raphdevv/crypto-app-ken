import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_colors.dart';

class TextFieldLogin extends StatefulWidget {
  final String topic;
  final String hint;
  const TextFieldLogin({super.key, required this.topic, required this.hint});

  @override
  State<TextFieldLogin> createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldLogin> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.topic,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          cursorColor: AppColors.primaryColor,
          keyboardType:
              widget.topic == 'อีเมล' ? TextInputType.emailAddress : null,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp),
          obscureText: widget.topic == 'อีเมล'
              ? false
              : check
                  ? true
                  : false,
          decoration: InputDecoration(
            suffixIcon: widget.topic == 'รหัสผ่าน'
                ? IconButton(
                    icon: check
                        ? const Icon(
                            Icons.visibility,
                            color: AppColors.whiteColor,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: AppColors.whiteColor,
                          ),
                    onPressed: () {
                      setState(() {
                        check = !check;
                      });
                    },
                  )
                : null,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            prefixIcon: Icon(
              widget.topic == 'อีเมล' ? Icons.email : Icons.lock,
              color: AppColors.primaryColor,
            ),
            focusColor: AppColors.primaryColor,
            fillColor: AppColors.greenColor,
            filled: true,
            hintText: widget.hint,
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
