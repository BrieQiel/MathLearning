import 'package:flutter/material.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/functions.dart';

class Credits extends StatelessWidget{
  const Credits({super.key});

  @override
  Widget build(BuildContext context){

    // size config to resize items based on the screen size
    SizeConfig().init(context);

    // disables native back button on android phones
    return WillPopScope(
      onWillPop: () async => false,

      child: Scaffold(
        body: Container(

          // displays background image
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/credits_forest.png'), fit: BoxFit.cover
            ),
          ),

          child: Center(
            child: Column(
              children: <Widget>[

                // container that contains 'CREDITS' message
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),

                  child: Stack(
                    children: <Widget>[

                      // Stroked text as border.
                      Text('Credits',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 6,
                          fontFamily: 'Arco',
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 10
                            ..color = Colors.white,
                        ),
                      ),

                      // Solid text as fill.
                      Text('Credits',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 6,
                          fontFamily: 'Arco',
                          color: const Color.fromRGBO(252, 85, 80, 1),
                        ),
                      ),

                    ],
                  ),
                ),

                // container that contains our names
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, .8),
                  ),

                  child: Column(
                    children: [
                      Text('Bercero, Jerome\n'
                            'Ligan, Bianca Marie\n'
                            'Morales, Raineson Ezekiel\n'
                            'Tierra, Christian Edmar\n'
                            'CS32S5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          fontFamily: 'Rainbow',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ),

                // spacer
                const SizedBox(height: 10,),

                // displays the back button
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 20,
                    height: SizeConfig.blockSizeVertical! * 1,
                    margin: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal! * 5),

                    child:

                      // a wide button that redirects to homescreen
                      // lesson,back and practice,back are the same
                      Displays().wideButton(context, 'lesson', 'back', 'Back', 'click', const Color.fromRGBO(136, 113, 255, 1)),

                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
