import 'dart:math';

import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/models/login_model.dart';
import 'package:crypto_app/page/loginpage/widget_login/textfield_login.dart';
import 'package:crypto_app/page/registorpage/registor_page.dart';
import 'package:crypto_app/services/bloc/login_bloc.dart';
import 'package:crypto_app/widget/bottom_nav.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginModel loginModel;
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;

  late TextEditingController email;
  late TextEditingController pass;

  @override
  void initState() {
    super.initState();
    loginModel = LoginModel(email: '', password: '');
    _loginBloc = LoginBloc();

    email = TextEditingController();
    pass = TextEditingController();
  }

  bool checkTyping = false;

  @override
  void dispose() {
    super.dispose();

    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BottomNav();
        } else {
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
                      height: 90.h,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        child: Form(
                          key: _globalFormKey,
                          child: Column(
                            children: [
                              TextFieldLogin(
                                topic: 'อีเมล',
                                hint: 'กรุณากรอกอีเมล',
                                textEditingController: email,
                                globalFormKey: _globalFormKey,
                                loginModel: loginModel,
                                check: checkTyping,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextFieldLogin(
                                topic: 'รหัสผ่าน',
                                hint: 'กรุณากรอกรหัสผ่าน',
                                textEditingController: pass,
                                globalFormKey: _globalFormKey,
                                loginModel: loginModel,
                                check: checkTyping,
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
                                  onPressed: () {
                                    setState(() {
                                      checkTyping = true;
                                    });
                                    _loginBloc.login(
                                        _globalFormKey, loginModel, context);
                                  },
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistorPage(),
                            ),
                          );
                        },
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
      },
    );
  }
}
