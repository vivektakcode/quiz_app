import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';
import './single_question_model.dart';

class Quiz extends StatelessWidget {
  List<SingleQuestion> questions;
  final int questionIndex;
  final Function() answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
   print("Number of answers: ${questions[questionIndex].singleAnswers.length}");
    return Column(children: [
      Question(
        questions[questionIndex].questionText,
      ),
      Answer((){
        answerQuestion();
      },
          questions[questionIndex].singleAnswers[0].text),
      Answer((){
        answerQuestion();
      }, questions[questionIndex].singleAnswers[1].text),
      Answer((){
        answerQuestion();
      }, questions[questionIndex].singleAnswers[2].text),
      Answer((){
        answerQuestion();
      }, questions[questionIndex].singleAnswers[3].text),
    ]);
  }
}
