// To parse this JSON data, do
//
//     final singleQuestion = singleQuestionFromJson(jsonString);

import 'dart:convert';

SingleQuestion singleQuestionFromJson(String str) =>
    SingleQuestion.fromJson(json.decode(str));

String singleQuestionToJson(SingleQuestion data) => json.encode(data.toJson());

class SingleQuestion {
  SingleQuestion({
    required this.questionText,
    required this.singleAnswers,
  });

  String questionText;
  List<SingleAnswer> singleAnswers;

  factory SingleQuestion.fromJson(Map<String, dynamic> json) => SingleQuestion(
        questionText:
            json["questionText"] == null ? null : json["questionText"],
        singleAnswers: json["answers"] == null
            ? []
            : List<SingleAnswer>.from(
                json["answers"].map((x) => SingleAnswer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questionText": questionText == null ? null : questionText,
        "answers": singleAnswers == null
            ? null
            : List<dynamic>.from(singleAnswers.map((x) => x.toJson())),
      };
}

class SingleAnswer {
  SingleAnswer({
    required this.text,
    required this.score,
  });

  String text;
  int score;

  factory SingleAnswer.fromJson(Map<String, dynamic> json) => SingleAnswer(
        text: json["text"] == null ? "" : json["text"],
        score: json["score"] == null ? 0 : json["score"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? "" : text,
        "score": score == null ? 0 : score,
      };
}
