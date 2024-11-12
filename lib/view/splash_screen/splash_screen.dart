import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:home_project/view/main_page/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 20.0, color: Colors.pink),
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Home! \n They need it..You have it!!',
                  speed: const Duration(milliseconds: 300)),
            ],
          ),
        ),
      ),
    );
  }
}
