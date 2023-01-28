import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/homepage/widget_homepage/card.dart';
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
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
              AppColors.primaryColor,
              AppColors.primaryTwoColor,
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Crypto',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            centerTitle: true,
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
                  voidCallback: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CardWidget(
                  text: 'แบบทดสอบ',
                  colors: AppColors.whiteColor,
                  imgPath: 'assets/images/test.png',
                  voidCallback: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CardWidget(
                  text: 'กระดานคะแนน',
                  colors: AppColors.whiteColor,
                  imgPath: 'assets/images/ranking.png',
                  voidCallback: () {},
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
