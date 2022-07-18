import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
import './single_question_model.dart';

void main() {
  runApp(const QuizForYou());
}

class QuizForYou extends StatefulWidget {
  const QuizForYou({Key? key}) : super(key: key);

  @override
  State<QuizForYou> createState() => _QuizForYouState();
}

class _QuizForYouState extends State<QuizForYou> {
  int _questionIndex = 0;
  int _totalScore = 0;
  final List<SingleQuestion> _questions = [
    SingleQuestion.fromJson({
      'questionText': 'Whats your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Black', 'score': 30},
        {'text': 'Blue', 'score': 20},
        {'text': 'Green', 'score': 40},
      ],
    }),
    SingleQuestion.fromJson({
      'questionText': 'Whats your favorite tourist destination?',
      'answers': [
        {'text': 'Goa', 'score': 10},
        {'text': 'Uttarakhand', 'score': 30},
        {'text': 'Himachal', 'score': 20},
        {'text': 'Rajasthan', 'score': 40},
      ],
    }),
    SingleQuestion.fromJson({
      'questionText': 'Whats your favourite icecream flavour?',
      'answers': [
        {'text': 'Butterscotch', 'score': 10},
        {'text': 'Vanilla', 'score': 30},
        {'text': 'Chocolate', 'score': 20},
        {'text': 'American Nuts', 'score': 40},
      ],
    }),
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // ignore: dead_code
  Widget build(BuildContext context) {



    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Let's quiz it up"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: () {
                  _answerQuestion(_totalScore);
                },
                questionIndex: _questionIndex,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: () {},
              ),
      ),
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    _questionIndex = _questionIndex + 1;
    Future.delayed(Duration(milliseconds: 200), (){
      setState(() {
        print('Set state is called');
      });
    });

    print('Question is answered');
    if (_questionIndex < _questions.length) {
      print("We've more questions");
    } else {
      print("We dont have more questions!");
    }
  }
}
