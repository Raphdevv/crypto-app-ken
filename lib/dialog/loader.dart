import 'package:crypto_app/const/app_colors.dart';
import 'package:flutter/material.dart';

class DialogShowLoading {
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: AppColors.overlayColor,
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
