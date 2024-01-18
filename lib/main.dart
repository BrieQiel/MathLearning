import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:mathlearning/splash.dart';

void main() {
  runApp(const MyApp());
}

final player = AudioPlayer();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override

  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/forest_pond.jpg"), context);
    precacheImage(const AssetImage("assets/images/tree_sky.jpg"), context);
    precacheImage(const AssetImage("assets/images/bg.jpg"), context);
    precacheImage(const AssetImage("assets/images/temp.jpg"), context);
    precacheImage(const AssetImage("assets/images/lesson_forest.jpg"), context);
    precacheImage(const AssetImage("assets/images/credits_forest.png"), context);
    precacheImage(const AssetImage("assets/images/congratulations.jpg"), context);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: []
    );

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}



// flutter run --release --no-sound-null-safety
// flutter build apk --release --no-sound-null-safety