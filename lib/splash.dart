import 'package:flutter/material.dart';
import 'package:mathlearning/home.dart';
import 'package:mathlearning/lesson.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3, //CHANGE TO 5 LATER
      imageBackground: Image.asset('assets/images/splashtest.png').image,
      navigateAfterSeconds: HomeScreen(),
      loaderColor: Colors.white,
    );
  }
}
