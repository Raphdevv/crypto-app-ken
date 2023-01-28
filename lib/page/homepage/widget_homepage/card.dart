import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  final VoidCallback voidCallback;
  final String text;
  final Color colors;
  final String imgPath;
  const CardWidget({
    super.key,
    required this.voidCallback,
    required this.text,
    required this.colors,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: InkWell(
        onTap: voidCallback,
        child: Container(
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
