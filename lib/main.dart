import 'package:crypto_app/page/homepage/home_page.dart';
import 'package:crypto_app/page/loginpage/login_page.dart';
import 'package:crypto_app/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, child) => MaterialApp(
        title: 'Crypto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Orbit',
        ),
        home: const LoginPage(),
      ),
    );
  }
}
