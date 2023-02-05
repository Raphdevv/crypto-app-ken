import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/app_colors.dart';

class DialogLogout {
  final BuildContext context;

  DialogLogout({required this.context});

  showDialogLogout(
      {required VoidCallback logout, required VoidCallback cancel}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: LogoutDialog(
            cancel: cancel,
            logout: logout,
          ),
        );
      },
    );
  }
}

class LogoutDialog extends StatelessWidget {
  final VoidCallback logout;
  final VoidCallback cancel;
  const LogoutDialog({
    super.key,
    required this.logout,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(flex: 2, child: Container()),
          Text(
            "คุณต้องการออกจากระบบใช่หรือไม่",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: cancel,
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: logout,
                    child: const Text(
                      'ออกจากระบบ',
                      style: TextStyle(
                        color: AppColors.whiteColor,
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
