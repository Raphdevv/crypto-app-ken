import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/lessonpage/widget_lessonpage/textfield_lessonpage.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonMainPage extends StatefulWidget {
  const LessonMainPage({super.key});

  @override
  State<LessonMainPage> createState() => _LessonMainPageState();
}

class _LessonMainPageState extends State<LessonMainPage> {
  List<String> topic = [
    'รู้จักเทคโนโลยี Blockchain',
    'รู้จักเหรียญดิจิทัลต่าง ๆ',
    'รู้จัก White Paper',
    'รู้ข้อดี ข้อเสีย ของตลาด Cryptocurrency',
    'เลือกเว็บเทรด Cryptocurrency ที่ชอบ',
    'หัดวิเคราะห์กราฟทางเทคนิค',
    'รู้จักควบคุมความเสี่ยงและบริหารเงินลงทุน',
  ];
  @override
  Widget build(BuildContext context) {
    return TemplageBg(
      showbg: true,
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
          title: const TextFiedlLesson(),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.overlayColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: SizedBox(
                        width: 300.w,
                        child: Text(
                          topic[index],
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: SizedBox(
                        width: 300.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.yellowColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'อ่าน',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
