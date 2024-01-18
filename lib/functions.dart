import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/home.dart';
import 'package:mathlearning/practice.dart';
import 'package:mathlearning/practiceAdding.dart';
import 'package:mathlearning/practiceSubtracting.dart';
import 'package:mathlearning/practiceCounting.dart';
import 'package:mathlearning/lessonAdding.dart';
import 'package:mathlearning/lessonSubtracting.dart';
import 'package:mathlearning/lessonCounting.dart';
import 'package:mathlearning/lesson.dart';
import 'package:mathlearning/credits.dart';

final player = AudioPlayer();

class Functions{

  // plays the background music based on the argument
  // the background music loops
  // to differentiate what loops and what doesnt:
    // loops? mp3
    // no loop? wav
  void playBackgroundMusic(String fileName) async {
    player.play(AssetSource('sounds/$fileName.mp3'));
    player.setReleaseMode(ReleaseMode.loop);
    player.resume();
  }

  // plays a non-looping sound
  playSound(String name){
    final player1 = AudioPlayer();
    player1.play(AssetSource('sounds/$name.wav'));
    player1.stop();
  }

  // stops playing the music
  stopSounds(){
    player.stop();
  }

  // plays quiz music based on chances
  // 'randomizes' the music played in practice/quiz
  // pinipilit ni edmar eh hays
  playRandomMusic(){
    Random random = Random();

    // returns a random number from 0-10
    int musicChoice = random.nextInt(10);

    // even chances
    if (musicChoice%2 == 0){
      Functions().playBackgroundMusic('quiz');
    }

    //odd chances
    else{
      Functions().playBackgroundMusic('quiz1');
    }

    // lowers the volume so the sfx something will be heard better
    // i dont think this works but its staying here
    player.setVolume(0.5);
  }

  // used in widebutton onpressed
  // if the 'route' in widebutton is 'home', this is called
  // goes to a specific level/route from home (home screen)
  homeRoute(BuildContext context, String level) {
    if (level == 'lesson'){
      // player.stop();
      playBackgroundMusic('mainmenu');
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Lesson()));
    }
    else if(level == 'practice'){
      //player.stop();
      playBackgroundMusic('mainmenu');
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Practice()));
    }
    else if(level == 'credits'){
      //player.stop();
      playBackgroundMusic('mainmenu');
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Credits()));
    }
    else if(level == 'quit'){
      //player.stop();
      //playBackgroundMusic('mainmenu');
      SystemNavigator.pop();
    }
  }

  // used in widebutton onpressed
  // if the 'route' in widebutton is 'practice', this is called
  // goes to a specific level/route from practice (practice screen)
  practiceRoute(BuildContext context, String level){
    if(level == 'counting'){
      player.stop();
      Functions().playRandomMusic();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PracticeCounting()));
    }
    else if(level == 'adding'){
      player.stop();
      Functions().playRandomMusic();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PracticeAdding()));
    }
    else if(level == 'subtracting'){
      player.stop();
      Functions().playRandomMusic();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PracticeSubtracting()));
    }
    else if(level == 'back'){
      playBackgroundMusic('mainmenu');
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  // used in widebutton onpressed
  // if the 'route' in widebutton is 'lesson', this is called
  // goes to a specific level/route from lesson (lesson screen)
  lessonRoute(BuildContext context, String level){
    if(level == 'counting'){
      player.stop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonCounting()));
    }
    else if(level == 'adding'){
      player.stop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonAdding()));
    }
    else if(level == 'subtracting'){
      player.stop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonSubtracting()));
    }
    else if(level == 'back'){
      playBackgroundMusic('mainmenu');
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

}

// class for display needs
class Displays{

  // displays any buttons honestly
  // any wide button you can see is this bad boy
  // aside from back in practices and lessons
  wideButton(BuildContext context, String route, String level, String levelName, String sound, Color color){

    return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 3),

        child: SizedBox(
          //width: SizeConfig.blockSizeHorizontal! * 8,
            height: SizeConfig.blockSizeVertical! * 13,

            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                          color: Colors.white,
                          width: 5
                      ),
                    )
                ),
              ),

              child: Text(levelName,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  fontFamily: 'Arco',
                  //color: Color.fromRGBO(116,53,33, 1),
                ),
              ),

              onPressed: () {
                // goes somewhere after home
                // home: lesson, practice, credits
                if(route == 'home'){
                  Functions().homeRoute(context, level);
                }

                // goes somewhere after practice screen
                // practice: counting, adding, subtracting, back
                else if(route == 'practice'){
                  Functions().practiceRoute(context, level);
                }

                // goes somewhere after lesson screen
                // lesson: counting, adding, subtracting, back
                else if(route == 'lesson'){
                  Functions().lessonRoute(context, level);
                }

                // goes to the practice level depending on who called it
                // counting button: counting screen
                // adding button: adding screen
                // subtracting button: subtracting screen
                else if(route == 'ready'){
                  Displays().awesomeReady(context, level);
                }

                // plays the sound of the button
                // usually the click thing
                // except the counting, adding, subtracting voices/buttons
                Functions().playSound(sound);
              },
            )
        )
    );
  }

  // shows up when user picked the wrong answer
  awesomeWrong(BuildContext context, String message){
    return AwesomeDialog(
      width: SizeConfig.blockSizeHorizontal! * 50,
      context: context,

      // displays the red X icon thingy
      dialogType: DialogType.error,

      // it pops from the middle yea
      animType: AnimType.scale,
      headerAnimationLoop: false,

      btnOkText: "Retry",
      btnOkColor: Colors.red,

      // the message showing on the pop up
      // i customized it cuz the default formating is too small
      body: Center(
          child: Column(
            children: [
              Text(message,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  fontFamily: 'Rainbow',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
      ),

      // button stylesz
      buttonsTextStyle: TextStyle(
          color: Colors.white,
          //fontWeight:FontWeight.w700,
          fontFamily: 'Rainbow',
          fontSize: SizeConfig.blockSizeHorizontal! * 3
      ),

      // it does nothing :\
      btnOkOnPress: () {},
    ).show();
  }

  // shows up when user clicks the back button in practices and lessons
  awesomeBack(BuildContext context, String route){
    return AwesomeDialog(
      width: SizeConfig.blockSizeHorizontal! * 50,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,

      btnOkText: "Yes",
      btnCancelText: "No",

      // the message showing on the pop up
      // i customized it cuz the default formating is too small
      body: Center(
          child: Column(
            children: [
              Text('Are you sure?\n',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  fontFamily: 'Rainbow',
                ),
                textAlign: TextAlign.center,
              ),

              Text('Leaving will reset your progress',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  fontFamily: 'Rainbow',
                ),
                textAlign: TextAlign.center,
              ),

            ],
          )
      ),

      buttonsTextStyle: TextStyle(
          color: Colors.white,
          //fontWeight:FontWeight.w700,
          fontFamily: 'Rainbow',
          fontSize: SizeConfig.blockSizeHorizontal! * 3
      ),

      // does nothing when they picked no
      btnCancelOnPress: () {
        //
      },


      btnOkOnPress: () {

        // stops the current playing music
        Functions().stopSounds();

        // plays the mainmenu music, the music of where theyre going
        Functions().playBackgroundMusic('mainmenu');

        // goes somewhere depending on where it's called
        // practice: to practice select
        // lesson: to lesson select
        if (route == 'practice'){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Practice()));
        }
        else if (route == 'lesson'){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Lesson()));
        }
      },
    ).show();
  }

  // shows up when user picks a level in practice select
  // makes sure kids are ready for some maths
  awesomeReady(BuildContext context, String level){
    return AwesomeDialog(
      width: SizeConfig.blockSizeHorizontal! * 50,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,

      btnOkText: "I'm ready",
      btnCancelText: "Not yet",

      // the message showing on the pop up
      // i customized it cuz the default formating is too small
      body: Center(
        child: Column(
          children: [
            Text('Are you ready?\n',
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                fontFamily: 'Rainbow',
              ),
              textAlign: TextAlign.center,
            ),

            Text('This practice have 5 questions. Take your time.',
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                fontFamily: 'Rainbow',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ),

      buttonsTextStyle: TextStyle(
        color: Colors.white,
        //fontWeight:FontWeight.w700,
        fontFamily: 'Rainbow',
        fontSize: SizeConfig.blockSizeHorizontal! * 3
      ),

      btnCancelOnPress: () {
        //
      },

      // goes to their levels
      // plays the randomizer music
      btnOkOnPress: () {
        Functions().practiceRoute(context, level);

        // the randommusic is called here because calling it in the practice levels
        // causes it to repick music everytime the state changes
        Functions().playRandomMusic();
      },
    ).show();
  }

}


