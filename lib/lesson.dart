import 'package:flutter/material.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/functions.dart';

class Lesson extends StatelessWidget  {
  const Lesson({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //Functions().playBackgroundMusic('practice');

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/tree_sky.jpg'), fit: BoxFit.fill
              )
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),

                  child: Stack(
                    children: <Widget>[

                      // Stroked text as border.
                      Text('Learn-o-rama!',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 8,
                          fontFamily: 'Arco',
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 10
                            ..color = Colors.white,
                        ),
                      ),

                      // Solid text as fill.
                      Text('Learn-o-rama!',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 8,
                          fontFamily: 'Arco',
                          color: const Color.fromRGBO(85, 150, 250, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 50,

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

                          // displays a button that says "Back to Practice Select", which goes to practice select screen
                          Displays().wideButton(context, 'lesson', 'counting', 'counting',  'counting', const Color.fromRGBO(80, 153, 205, 1)),

                          //displays a buttons that says "Practice again", which goes to counting screen
                          Displays().wideButton(context, 'lesson', 'adding', 'adding', 'adding', const Color.fromRGBO(255, 224, 70, 1)),

                          //displays a buttons that says "Practice again", which goes to counting screen
                          Displays().wideButton(context, 'lesson', 'subtracting', 'subtracting', 'subtracting', const Color.fromRGBO(255, 144, 55, 1)),

                          //displays a buttons that says "Practice again", which goes to counting screen
                          Displays().wideButton(context, 'lesson', 'back', 'Back', 'click', const Color.fromRGBO(223, 52, 86, 1)),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}