import 'package:flutter/material.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/functions.dart';

class CongratulationsCounting extends StatelessWidget{
  const CongratulationsCounting({super.key});

  @override
  Widget build(BuildContext context){

    // size config to resize items based on the screen size
    SizeConfig().init(context);

    // plays congratulation.wav once the screen appears
    Functions().playSound('congratulations');

    // disables native back button on android phones
    return WillPopScope(
      onWillPop: () async => false,

      // calls displayCongratulations function
      // will redirect to counting quiz screen
      child:
        displayCongratulations(context, 'counting')
    );
  }
}

class CongratulationsAdding extends StatelessWidget{
  const CongratulationsAdding({super.key});

  @override
  Widget build(BuildContext context){

    // size config to resize items based on the screen size
    SizeConfig().init(context);

    // plays congratulation.wav once the screen appears
    Functions().playSound('congratulations');

    // disables native back button on android phones
    return WillPopScope(
        onWillPop: () async => false,

        // calls displayCongratulations function
        // will redirect to adding quiz screen
        child:
          displayCongratulations(context, 'adding')
    );
  }
}

class CongratulationsSubtracting extends StatelessWidget{
  const CongratulationsSubtracting({super.key});

  @override
  Widget build(BuildContext context){

    // size config to resize items based on the screen size
    SizeConfig().init(context);

    // plays congratulation.wav once the screen appears
    Functions().playSound('congratulations');

    // disables native back button on android phones
    return WillPopScope(
      onWillPop: () async => false,

        // calls displayCongratulations function
        // will redirect to subtracting quiz screen
      child:
        displayCongratulations(context, 'subtracting')
    );
  }
}

displayCongratulations(BuildContext context, String level){
  return Scaffold(
    body: Container(

      // displays background image
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/congratulations.png'), fit: BoxFit.cover
        ),
      ),

      child: Center(
        child: Column(
          children: <Widget>[

            // container that contains 'CONGRATULATIONS!' message
            Container(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 20),

              child: Stack(
                children: <Widget>[

                  // Stroked text as border.
                  Text('Congratulations!',
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
                  Text('Congratulations!',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal! * 9,
                      fontFamily: 'Arco',
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),

            // text subtitle
            Text('You have finished the $level Practice!',
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                fontFamily: 'Arco',
                color: Colors.black,
              ),
            ),

            // spacer
            const SizedBox(height: 20,),

            // asks the user what to do after
            Text('Would you like to go back to the practice level select or practice again?',
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                fontFamily: 'Rainbow',
                color: Colors.black,
              ),
            ),

            // spacer
            const SizedBox(height: 20,),

            // displays the two buttons
            Expanded(
              child: SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 80,

                // shows the button in a grid with 2 columns per row
                child: GridView(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                    // 2 columns
                    crossAxisCount: 2,

                    // the ratio of the elements inside the 'cell'
                    childAspectRatio: 4,

                  ),

                  children: <Widget>[

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
                    Displays().wideButton(context, 'home', 'practice', 'Practice Select',  'click', const Color.fromRGBO(136, 113, 255, 1)),

                    //displays a buttons that says "Practice again", which goes to counting screen
                    Displays().wideButton(context, 'practice', level, 'Practice again', 'click', const Color.fromRGBO(242, 201, 78, 1.0)),

                  ]
                ),
              )
            ),
          ],
        ),
      ),
    ),
  );
}