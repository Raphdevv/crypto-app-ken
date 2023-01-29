import 'dart:developer';

import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/homepage/widget_homepage/card.dart';
import 'package:crypto_app/page/lessonpage/lessson_main_page.dart';
import 'package:crypto_app/page/loginpage/login_page.dart';
import 'package:crypto_app/page/rankingpage/ranking_page.dart';
import 'package:crypto_app/page/testpage/test_main_page.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text(
            'Crypto',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  log('ออกจากระบบ');
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false);
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CardWidget(
                text: 'เนื้อหาและบทเรียน',
                colors: AppColors.whiteColor,
                imgPath: 'assets/images/lesson.png',
                voidCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LessonMainPage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CardWidget(
                text: 'แบบทดสอบ',
                colors: AppColors.whiteColor,
                imgPath: 'assets/images/test.png',
                voidCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestMainPage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CardWidget(
                text: 'กระดานคะแนน',
                colors: AppColors.whiteColor,
                imgPath: 'assets/images/ranking.png',
                voidCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RankingPage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
