import 'dart:math';

var imagesCounting = [
  'assets/images/lesson/first.png',
  'assets/images/lesson/counting/tc_1.png',
  'assets/images/lesson/counting/tc_2.png',
  'assets/images/lesson/counting/tc_3.png',
  'assets/images/lesson/counting/tc_4.png',
  'assets/images/lesson/counting/tc_5.png',
  'assets/images/lesson/counting/tc_6.png',
  'assets/images/lesson/counting/tc_7.png',
  'assets/images/lesson/last.png',
];

var imagesAdding = [
  'assets/images/lesson/first.png',
  'assets/images/lesson/adding/ta_1.png',
  'assets/images/lesson/adding/ta_2.png',
  'assets/images/lesson/adding/ta_3.png',
  'assets/images/lesson/adding/ta_4.png',
  'assets/images/lesson/adding/ta_5.png',
  'assets/images/lesson/adding/ta_6.png',
  'assets/images/lesson/adding/ta_7.png',
  'assets/images/lesson/last.png',
];

var imagesSubtracting = [
  'assets/images/lesson/first.png',
  'assets/images/lesson/subtracting/ts_1.png',
  'assets/images/lesson/subtracting/ts_2.png',
  'assets/images/lesson/subtracting/ts_3.png',
  'assets/images/lesson/subtracting/ts_4.png',
  'assets/images/lesson/subtracting/ts_5.png',
  'assets/images/lesson/subtracting/ts_6.png',
  'assets/images/lesson/subtracting/ts_7.png',
  'assets/images/lesson/last.png',
];

List<Map<String, dynamic>> counting = [
  {'ques': "c_1", 'ans': 1, 'desc': "1 (ONE) banana!"},
  {'ques': "c_2", 'ans': 2, 'desc': "2 (TWO) apples!"},
  {'ques': "c_3", 'ans': 3, 'desc': "3 (THREE) cherries!"},
  {'ques': "c_4", 'ans': 4, 'desc': "4 (FOUR) pigs!"},
  {'ques': "c_5", 'ans': 5, 'desc': "5 (FIVE) bears!"},
  {'ques': "c_6", 'ans': 6, 'desc': "6 (SIX) tigers!"},
  {'ques': "c_7", 'ans': 7, 'desc': "7 (SEVEN) watermelons!"},
  {'ques': "c_8", 'ans': 8, 'desc': "8 (EIGHT) raccoons!"},
  {'ques': "c_9", 'ans': 9, 'desc': "9 (NINE) mangoes!"},
  {'ques': "c_10", 'ans': 10, 'desc': "10 (TEN) zebras!"},
];

List<Map<String, dynamic>> adding = [
  {'ques': "a_1", 'ans': 4, 'desc': "1 + 3 = 4"},
  {'ques': "a_2", 'ans': 7, 'desc': "1 + 6 = 7"},
  {'ques': "a_3", 'ans': 9, 'desc': "4 + 5 = 9"},
  {'ques': "a_4", 'ans': 2, 'desc': "1 + 1 = 2"},
  {'ques': "a_5", 'ans': 5, 'desc': "3 + 2 = 5"},
  {'ques': "a_6", 'ans': 8, 'desc': "4 + 4 = 8"},
  {'ques': "a_7", 'ans': 4, 'desc': "2 + 2 = 4"},
  {'ques': "a_8", 'ans': 6, 'desc': "1 + 5 = 6"},
  {'ques': "a_9", 'ans': 3, 'desc': "1 + 2 = 3"},
  {'ques': "a_10", 'ans': 9, 'desc': "3 + 6 = 9"},
];

List<Map<String, dynamic>> subtracting = [
  {'ques': "s_1", 'ans': 5, 'desc': "9 - 4 = 5"},
  {'ques': "s_2", 'ans': 7, 'desc': "8 - 1 = 7"},
  {'ques': "s_3", 'ans': 2, 'desc': "7 - 5 = 2"},
  {'ques': "s_4", 'ans': 4, 'desc': "8 - 4 = 4"},
  {'ques': "s_5", 'ans': 1, 'desc': "9 - 8 = 1"},
  {'ques': "s_6", 'ans': 5, 'desc': "6 - 1 = 5"},
  {'ques': "s_7", 'ans': 3, 'desc': "7 - 4 = 3"},
  {'ques': "s_8", 'ans': 2, 'desc': "5 - 3 = 2"},
  {'ques': "s_9", 'ans': 6, 'desc': "9 - 3 = 6"},
  {'ques': "s_10", 'ans': 4, 'desc': "6 - 2 = 4"},
];

randomChoices(int correct){
  Random random = Random();
  List<int> choices = [correct];
  while (choices.length < 4) {
    int randomNumber = random.nextInt(10)+1;
    if (!choices.contains(randomNumber)) {
      choices.add(randomNumber);
    }
  }
  return choices;
}

randomQuestions(){
  Random random = Random();
  List<int> questions = [];
  while (questions.length < 5){
    int randomNumber = random.nextInt(10);
    if (!questions.contains(randomNumber)) {
      questions.add(randomNumber);
    }
  }
  return questions;
}


