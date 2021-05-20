import 'package:flutter/material.dart';
import 'Question.dart';
import 'answer.dart';
import 'restartscreen.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int questionIndex = 0;
  int score = 0;
  String checkyou = "";

  checkAnswer() {
    if (score < 10) {
      checkyou = "You Have low Score";
    } else if (score <= 20) {
      checkyou = "You have avg Score";
    } else {
      checkyou = "You have Best Score";
    }
  }

  void onPressedAnswer(int scoreAns) {
    score = score + scoreAns;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    if (questionIndex >= questions.length) {
      checkAnswer();
    } else {
      //
    }
  }

  restart() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  var answers = ["Blue", "Dog", "Yellow"];

  var questions = [
    {
      "Question": "WHat is you fav Color1",
      "Answer": [
        {"text": "Blue", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 1},
        {"text": "White", "score": 3},
      ],
    },
    {
      "Question": "WHat is you fav Animal",
      "Answer": [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My First App",
          ),
        ),
        body: (questionIndex >= questions.length)
            ? RestartPage(
                text: checkyou,
                onPresssHandler: restart,
              )
            : Column(
                children: [
                  QuestionText(questions[questionIndex]["Question"]),
                  ...(questions[questionIndex]["Answer"] as List<dynamic>)
                      .map((answer) {
                    return Answer(() {
                      onPressedAnswer(answer["score"]);
                    }, answer["text"].toString());
                  }).toList(),
                ],
              ),
      ),
    );
  }
}
