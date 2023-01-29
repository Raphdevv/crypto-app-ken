import 'package:crypto_app/page/homepage/home_page.dart';
import 'package:crypto_app/page/loginpage/login_page.dart';
import 'package:crypto_app/widget/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
