import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mathlearning/questions.dart';

import 'package:mathlearning/size_config.dart';
import 'package:mathlearning/functions.dart';

class LessonAdding extends StatelessWidget  {
  const LessonAdding({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Functions().playBackgroundMusic('lesson');

    return WillPopScope(
      onWillPop: () async => false,

      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/lesson_forest.jpg'), fit: BoxFit.cover
                ),
              ),

              child: Swiper(
                itemCount: imagesCounting.length,
                itemWidth: SizeConfig.blockSizeHorizontal! * 80,
                itemHeight: SizeConfig.blockSizeVertical! * 95,
                loop: false,
                layout: SwiperLayout.STACK,

                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imagesAdding[index],
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },

                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    space: 8.0,

                    size: 10.0,
                    color: Colors.grey,

                    activeSize: 15.0,
                    activeColor: Colors.purple
                  )
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,

              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 50, 5),

                child: ElevatedButton(
                  onPressed: () {
                    Displays().awesomeBack(context, 'lesson');
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

                    width: 80,
                    height: 50,
                    //padding: const EdgeInsets.fromLTRB(0, 50, 50, 5),

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
        )
      ),
    );
  }
}
