import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/registorpage/widget_registor/textfield_registor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/template_bg.dart';

class RegistorPage extends StatefulWidget {
  const RegistorPage({super.key});

  @override
  State<RegistorPage> createState() => _RegistorPageState();
}

class _RegistorPageState extends State<RegistorPage> {
  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 0.01.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.overlayColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        TextFieldRegistor(
                          topic: 'อีเมล',
                          hint: 'กรุณากรอกอีเมล',
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFieldRegistor(
                          topic: 'ชื่อผู้ใช้',
                          hint: 'กรุณากรอกชื่อผู้ใช้',
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFieldRegistor(
                          topic: 'รหัสผ่าน',
                          hint: 'กรุณากรอกรหัสผ่าน',
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFieldRegistor(
                          topic: 'ยืนยันรหัสผ่าน',
                          hint: 'กรุณากรอกการยืนยันรหัสผ่าน',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.yellowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'สมัครสมาชิก',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.01.h,
            ),
          ],
        ),
      ),
    );
  }
}
