import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/loginpage/widget_login/textfield_login.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/exchange.png',
                height: 120.h,
              ),
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
                      children: [
                        TextFieldLogin(
                          topic: 'อีเมล',
                          hint: 'กรุณากรอกอีเมล',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFieldLogin(
                          topic: 'รหัสผ่าน',
                          hint: 'กรุณากรอกรหัสผ่าน',
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
                              'เข้าสู่ระบบ',
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
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ยังไม่มีบัญชีผู้ใช้ใช่ไหม',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'กดที่นี่',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 12.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
