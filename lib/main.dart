import 'package:flutter/material.dart';
import 'package:home_project/view/initial_screen/login_screen/login_screen.dart';
import 'package:home_project/view/main_page/main_page.dart';
import 'package:home_project/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
