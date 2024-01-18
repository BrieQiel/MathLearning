import 'package:flutter/material.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/functions.dart';


class Practice extends StatelessWidget {
  const Practice({super.key});

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
                      Text('Ready, Set, Practice!',
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
                      Text('Ready, Set, Practice!',
                        style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 8,
                        fontFamily: 'Arco',
                        color: const Color.fromRGBO(252, 85, 80, 1),
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
                        Displays().wideButton(context, 'ready', 'counting', '"Count" Me In!',  'counting', const Color.fromRGBO(136, 113, 255, 1)),

                        //displays a buttons that says "Practice again", which goes to counting screen
                        Displays().wideButton(context, 'ready', 'adding', '"Add" Some Fun!', 'adding', const Color.fromRGBO(242, 201, 78, 1.0)),

                        //displays a buttons that says "Practice again", which goes to counting screen
                        Displays().wideButton(context, 'ready', 'subtracting', '"Subtract"-o-Mania!', 'subtracting', const Color.fromRGBO(255, 180, 175, 1.0)),

                        //displays a buttons that says "Practice again", which goes to counting screen
                        Displays().wideButton(context, 'practice', 'back', 'Back', 'click', const Color.fromRGBO(252, 85, 80, 1)),
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