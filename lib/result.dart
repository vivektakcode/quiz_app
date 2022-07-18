import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  Result({required this.resultScore, required this.resetHandler});

  String get resultPhrase {
    String resultText = 'You did it';
    if (resultScore <= 60) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 120) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore <= 40) {
      resultText = 'You are strange';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            resetHandler();
          },
          child: Text('Restart App'),
        )
      ],
    ));
  }
}
