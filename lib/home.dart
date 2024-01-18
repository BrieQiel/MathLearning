import 'package:flutter/material.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/functions.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Functions().playBackgroundMusic('mainmenu');

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/forest_pond.jpg'), fit: BoxFit.cover
          ),
        ),

        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, SizeConfig.blockSizeHorizontal! * 7, 0, 20),

                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text('Math Adventure',
                      style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal! * 9,
                      fontFamily: 'Arco',
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 10
                        ..color = Colors.white,
                      ),
                    ),

                    // Solid text as fill.
                    Text('Math Adventure',
                      style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal! * 9,
                      fontFamily: 'Arco',
                      color: const Color.fromRGBO(252, 85, 80, 1),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 40,

                  child: ListView(
                    children: [
                      // parameters: (BuildContext context, String route, String level, String levelName, String sound, Color color)
                                                          // routes and levels:
                                                          // home (goes to the routes available in homescreen):
                                                          //      lesson
                                                          //      practice
                                                          // practice (goes to the routes available in practice):
                                                          //      counting
                                                          //      adding
                                                          //      subtracting
                                                          //      back
                                                          // ready (calls awesomeready, then goes to the routes available in practice):
                                                          //      counting
                                                          //      adding
                                                          //      subtracting

                      // displays a button that says "Lessons", which goes to lessons select screen
                      Displays().wideButton(context, 'home', 'lesson', 'Lessons',  'click', const Color.fromRGBO(252, 85, 80, 1)),

                      //displays a buttons that says "Practice", which goes to practice select screen
                      Displays().wideButton(context, 'home', 'practice', 'Practice', 'click', const Color.fromRGBO(252, 85, 80, 1)),

                      //displays a buttons that says "Practice", which goes to practice select screen
                      Displays().wideButton(context, 'home', 'quit', 'Quit', 'click', const Color.fromRGBO(252, 85, 80, 1)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//Navigator.pop(context);