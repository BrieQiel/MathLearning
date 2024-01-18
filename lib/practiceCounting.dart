import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/congratulations.dart';
import 'package:mathlearning/questions.dart';
import 'package:mathlearning/functions.dart';

// makes a questionImage variable for calling questions
AssetImage questionImage = AssetImage('');


class PracticeCounting extends StatefulWidget {
  const PracticeCounting({super.key});
  @override
  State<PracticeCounting> createState() => _PracticeCounting();
}

class _PracticeCounting extends State<PracticeCounting>{

  // gets 5 random numbers from 1 to 10
  List<int> qNum = gatherQuestions();

  // sets index for the five questions
  int index = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop:() async => false,
      child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  // background image
                    image: AssetImage('assets/images/quizbg1.png'), fit: BoxFit.cover
                )
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Let's Count!
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(50, 15, 0, 5),
                          child: Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text('"Count" Me In!',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                                  fontFamily: 'Rainbow',
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 5
                                    ..color = const Color.fromRGBO(171, 207, 56, 1),
                                ),
                              ),

                              // Solid text as fill.
                              Text('"Count" Me In!',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                                  fontFamily: 'Rainbow',
                                  color: Colors.white,
                                ),
                              ),
                            ]
                          )
                        )
                      ),

                      Align(
                          alignment: Alignment.topRight,

                          child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 50, 5),

                              child: ElevatedButton(
                                  onPressed: () {
                                    Displays().awesomeBack(context, 'practice');
                                  },

                                  // color and border and fonts of the button
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade700),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: const BorderSide(color: Colors.white, width: 5),
                                        )
                                    ),  // MaterialStateProperty
                                  ),

                                  // the box 1:1
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.blockSizeHorizontal! * 9,
                                    height: SizeConfig.blockSizeHorizontal! * 5.5,

                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text('Back',
                                          style: TextStyle(
                                            fontSize: SizeConfig.blockSizeHorizontal! * 2,
                                            fontFamily: 'Arco',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  )
                              )
                          )
                      )
                    ],
                  ),

                  Container(
                      alignment: Alignment.center,
                      width: SizeConfig.blockSizeHorizontal! * 90,
                      height: SizeConfig.blockSizeVertical! * 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 5,
                          color: const Color.fromRGBO(171, 207, 56, 1),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child:
                      // qNum[index] is the random number in position 'index'
                      // quesAndAns[qNum[index]]['ques'] gets the question in the 'random-number' index from map
                      questionDisplay(counting[qNum[index]]['ques'])
                  ),
                  buttons(context, counting[qNum[index]]['ans'], index, counting[qNum[index]]['desc']),
                ],
              ),
            ),
          )
      ),
    );
  }

  buttons(BuildContext context, int ans, int index, String desc){
    List<int> choices = gatherChoices(qNum[index]);
    //print(choices);
    return Expanded(
        child: SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 65,
          child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 30,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                buttonChoices(ans, context, choices[0], desc, Colors.pink),
                buttonChoices(ans, context, choices[1], desc, Colors.teal),
                buttonChoices(ans, context, choices[2], desc, Colors.orange),
                buttonChoices(ans, context, choices[3], desc, Colors.lime)
              ]
          ),
        )
    );
  }

// the individual buttons
  buttonChoices(int ans, BuildContext context, int choice, String desc, Color color){
    return ElevatedButton(
        onPressed: () {
          if (choice == ans) {
            Functions().playSound('correct');
            awesomeCorrect(context, 'Good Job!', desc);
          }
          else {
            Functions().playSound('wrong');
            Displays().awesomeWrong(context, 'Not quite right! Try again');
          }
        },

        // color and border and fonts of the button
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(color: Colors.white, width: 5),
              )
          ),  // MaterialStateProperty
        ),

        // the box 1:1
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              alignment: Alignment.center,
              child: Text('$choice',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 7,
                  fontFamily: 'Arco',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
    );
  }

  questionDisplay(String fileName){
    questionImage = AssetImage('assets/images/quiz/$fileName.png');
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 15, 0, 5),
      width: SizeConfig.blockSizeHorizontal! * 70,
      height: SizeConfig.blockSizeVertical! * 30,
      decoration: BoxDecoration(
        //color: Colors.red,
        image: DecorationImage(
            image: questionImage, fit: BoxFit.fitHeight
        ),
      ),
    );
  }

// awesomedialog for correct answers
  awesomeCorrect(BuildContext context, String message, String desc){
    return AwesomeDialog(
      width: SizeConfig.blockSizeHorizontal! * 50,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      headerAnimationLoop: false,

      btnOkText: "Next",

      body: Center(
          child: Column(
            children: [
              Text('$message\n',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  fontFamily: 'Rainbow',
                ),
                textAlign: TextAlign.center,
              ),

              Text('$desc\n',
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

      btnOkOnPress: () {
        questionAscension(context);
      },
      btnOkColor: Colors.green,
    ).show();
  }

  // sets the index then refreshes the state
  questionAscension(BuildContext context){
    if (index < 4){
      setState(() {
        index++;
      });
    }
    else{
      Functions().stopSounds();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CongratulationsCounting()));
      index = 0;
    }
  }
}

// displays the picture of fruits and animals
questionDisplay(String fileName){
  // sets the questionImage into the picture of the question
  questionImage = AssetImage('assets/images/quiz/$fileName.png');

  return Container(
    padding: const EdgeInsets.fromLTRB(50, 15, 0, 5),
    width: SizeConfig.blockSizeHorizontal! * 70,
    height: SizeConfig.blockSizeVertical! * 30,
    decoration: BoxDecoration(
      //color: Colors.red,
      image: DecorationImage(
          image: questionImage, fit: BoxFit.fitHeight
      ),
    ),
  );
}

// BACKEND

// gets random choices+correct answer
gatherChoices(int index){
  List<int> choices = [];
  int correct = counting[index]['ans'];
  for(int choice in randomChoices(correct)){
    choices.add(choice);
  }
  choices.shuffle();
  return choices;
}

// gets 5 random numbers aka the indexes of the questions map
gatherQuestions(){
  List<int> question = [];
  for (int q in randomQuestions()){
    question.add(q);
  }
  return question;
}
