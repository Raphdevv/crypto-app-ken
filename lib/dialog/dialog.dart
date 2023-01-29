import 'package:crypto_app/page/rankingpage/ranking_page.dart';
import 'package:crypto_app/widget/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/app_colors.dart';

class DialogCrypto {
  final BuildContext context;

  DialogCrypto({required this.context});

  showDialogTesting({String text = '', required VoidCallback voidCallback}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TestingDialog(
            text: text,
            voidCallback: voidCallback,
          ),
        );
      },
    );
  }

  showDialogPoint({required String text}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: PointDialog(
            text: text,
          ),
        );
      },
    );
  }
}

class TestingDialog extends StatelessWidget {
  final String text;
  final VoidCallback voidCallback;
  const TestingDialog({
    super.key,
    required this.text,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(flex: 2, child: Container()),
          Text(
            text,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18.sp,
            ),
          ),
          Flexible(flex: 2, child: Container()),
          Container(
            height: 60.h,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.yellowColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SizedBox(
              width: 100.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: voidCallback,
                child: const Text(
                  'ตกลง',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PointDialog extends StatelessWidget {
  final String text;
  const PointDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(flex: 2, child: Container()),
          Text(
            'คะแนนของคุณคือ: $text',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18.sp,
            ),
          ),
          Flexible(flex: 2, child: Container()),
          Container(
            height: 60.h,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.yellowColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNav(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'หน้าหลัก',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RankingPage(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'กระดานคะแนน',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
