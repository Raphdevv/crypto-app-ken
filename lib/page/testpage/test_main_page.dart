import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/testpage/testing/testing_page.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestMainPage extends StatefulWidget {
  const TestMainPage({super.key});

  @override
  State<TestMainPage> createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: false,
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/exchange.png',
                height: 150.h,
                width: 150.w,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.overlayColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Text(
                      'Wait Content',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: SizedBox(
                        width: 300.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TestingPage(),
                              ),
                            );
                          },
                          child: Text(
                            'เริ่มทำแบบทำแบบทดสอบ',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
