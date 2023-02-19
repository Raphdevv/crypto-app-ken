import 'package:crypto_app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../page/aboutme/about_me_page.dart';
import '../page/homepage/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  static const List<Widget> page = [
    MyHomePage(),
    AboutMe(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryTwoColor,
        body: page.elementAt(selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: BottomNavigationBar(
            selectedItemColor: selectedIndex == 0
                ? AppColors.yellowColor
                : AppColors.greenColor,
            backgroundColor: AppColors.overlayColor,
            unselectedItemColor: selectedIndex == 1
                ? AppColors.yellowColor
                : AppColors.greenColor,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About Me',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: (value) => setState(
              () {
                selectedIndex = value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
