import 'package:flutter/material.dart';
import 'Question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int questionIndex = 0;

  void onPressedAnswer() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }


  var questions = [
    {
      "Question": "WHat is you fav Color1",
      "Answer": ["Blue", "Red", "Yellow", "Green"],
    },
    {
      "Question": "WHat is you fav Color2",
      "Answer": ["Blue", "Red", "Yellow"],
    },
    {
      "Question": "WHat is you fav Color3",
      "Answer": [1, "Red", "Yellow", "Green"],
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
        body: Column(
          children: [
            QuestionText(questions[questionIndex]["Question"]),
            ...(questions[questionIndex]["Answer"] as List<dynamic>)
                .map((answer) {
              return Answer(onPressedAnswer, answer.toString());
            }).toList(),
          ],
        ),
      ),
    );
  }
}
