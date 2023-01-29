import 'package:crypto_app/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_colors.dart';

class TextFieldLogin extends StatefulWidget {
  final String topic;
  final String hint;
  final TextEditingController textEditingController;
  final GlobalKey<FormState> globalFormKey;
  final LoginModel loginModel;
  final bool check;
  const TextFieldLogin({
    super.key,
    required this.topic,
    required this.hint,
    required this.textEditingController,
    required this.globalFormKey,
    required this.loginModel,
    required this.check,
  });

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
          onSaved: (newValue) {
            if (widget.topic == 'อีเมล') {
              setState(() {
                widget.loginModel.email = newValue!;
              });
            } else if (widget.topic == 'รหัสผ่าน') {
              widget.loginModel.password = newValue!;
            }
          },
          onChanged: (value) {
            if (widget.check) {
              widget.globalFormKey.currentState!.validate();
            }
          },
          validator: (value) {
            if (widget.topic == 'อีเมล') {
              if (value == null || value.isEmpty) {
                return 'กรุณากรอกอีเมล';
              } else if (value.contains('@') == false) {
                return 'กรุณากรอกรูปแบบอีเมลให้ถูกต้อง';
              }
              return null;
            } else if (widget.topic == 'รหัสผ่าน') {
              if (value == null || value.isEmpty) {
                return 'กรุณากรอกรหัสผ่าน';
              } else if (value.length < 6) {
                return 'รหัสผ่านต้องมีมากกว่า 6 ตัวอักษร';
              }
              return null;
            }
            return null;
          },
        ),
      ],
    );
  }
}
