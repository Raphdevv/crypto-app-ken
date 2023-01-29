import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/models/registor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldRegistor extends StatefulWidget {
  final String topic;
  final String hint;
  final TextEditingController textEditingController;
  final GlobalKey<FormState> globalFormKey;
  final RegistorModel registorModel;
  final bool check;
  const TextFieldRegistor({
    super.key,
    required this.topic,
    required this.hint,
    required this.textEditingController,
    required this.globalFormKey,
    required this.registorModel,
    required this.check,
  });

  @override
  State<TextFieldRegistor> createState() => _TextFieldRegistorState();
}

class _TextFieldRegistorState extends State<TextFieldRegistor> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.topic,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: AppColors.primaryColor,
          inputFormatters: widget.topic == 'ชื่อผู้ใช้'
              ? [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                ]
              : null,
          keyboardType:
              widget.topic == 'อีเมล' ? TextInputType.emailAddress : null,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp),
          obscureText: widget.topic == 'อีเมล' || widget.topic == 'ชื่อผู้ใช้'
              ? false
              : check
                  ? true
                  : false,
          decoration: InputDecoration(
            suffixIcon:
                widget.topic == 'รหัสผ่าน' || widget.topic == 'ยืนยันรหัสผ่าน'
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
              widget.topic == 'อีเมล'
                  ? Icons.email
                  : widget.topic == 'ชื่อผู้ใช้'
                      ? Icons.person
                      : Icons.lock,
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
                widget.registorModel.email = newValue!;
              });
            } else if (widget.topic == 'ชื่อผู้ใช้') {
              setState(() {
                widget.registorModel.username = newValue!;
              });
            } else if (widget.topic == 'รหัสผ่าน') {
              setState(() {
                widget.registorModel.password = newValue!;
              });
            } else {
              setState(() {
                widget.registorModel.passwordCon = newValue!;
              });
            }
          },
          onChanged: (value) {
            if (widget.topic == 'รหัสผ่าน') {
              setState(() {
                widget.registorModel.password = value;
              });
            }
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
            } else if (widget.topic == 'ชื่อผู้ใช้') {
              if (value == null || value.isEmpty) {
                return 'กรุณากรอกรชื่อผู้ใช้';
              }
              return null;
            } else if (widget.topic == 'รหัสผ่าน') {
              if (value == null || value.isEmpty) {
                return 'กรุณากรอกรหัสผ่าน';
              } else if (value.length < 6) {
                return 'รหัสผ่านต้องมีมากกว่า 6 ตัวอักษร';
              }
              return null;
            } else {
              if (value == null || value.isEmpty) {
                return 'กรุณากรอกรหัสผ่าน';
              } else if (value != widget.registorModel.password) {
                return 'กรุณากรอกรหัสผ่านให้ตรงกัน';
              }
              return null;
            }
          },
        ),
      ],
    );
  }
}
