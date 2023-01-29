import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/models/registor_model.dart';
import 'package:crypto_app/page/registorpage/widget_registor/textfield_registor.dart';
import 'package:crypto_app/services/bloc/registor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/template_bg.dart';

class RegistorPage extends StatefulWidget {
  const RegistorPage({super.key});

  @override
  State<RegistorPage> createState() => _RegistorPageState();
}

class _RegistorPageState extends State<RegistorPage> {
  late RegistorModel registorModel;
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  late RegistorBloc _registorBloc;

  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController pass;
  late TextEditingController passCon;

  @override
  void initState() {
    super.initState();
    registorModel = RegistorModel(
      email: '',
      username: '',
      password: '',
      passwordCon: '',
    );
    _registorBloc = RegistorBloc();
    email = TextEditingController();
    username = TextEditingController();
    pass = TextEditingController();
    passCon = TextEditingController();
  }

  bool checkTyping = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    username.dispose();
    pass.dispose();
    passCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90.h,
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
                      key: _globalFormKey,
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
                            textEditingController: email,
                            globalFormKey: _globalFormKey,
                            registorModel: registorModel,
                            check: checkTyping,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFieldRegistor(
                            topic: 'ชื่อผู้ใช้',
                            hint: 'กรุณากรอกชื่อผู้ใช้',
                            textEditingController: username,
                            globalFormKey: _globalFormKey,
                            registorModel: registorModel,
                            check: checkTyping,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFieldRegistor(
                            topic: 'รหัสผ่าน',
                            hint: 'กรุณากรอกรหัสผ่าน',
                            textEditingController: pass,
                            globalFormKey: _globalFormKey,
                            registorModel: registorModel,
                            check: checkTyping,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFieldRegistor(
                            topic: 'ยืนยันรหัสผ่าน',
                            hint: 'กรุณากรอกรหัสผ่านอีกครั้ง',
                            textEditingController: passCon,
                            globalFormKey: _globalFormKey,
                            registorModel: registorModel,
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
                                _registorBloc.registor(
                                  _globalFormKey,
                                  registorModel,
                                );
                              },
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
      ),
    );
  }
}
