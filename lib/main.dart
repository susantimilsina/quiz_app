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
  int score = 20;
  String checkyou= "";

  checkAnswer(){
    if(score < 10 ){
      checkyou = "You Have low Score";
    }else if(score <= 20){
      checkyou = "You have avg Score";
    }else{
      checkyou = "You have Best Score";
    }
  }

  void onPressedAnswer() {
      checkAnswer();

    if (questionIndex >= questions.length) {
      print("Question Finished ");
    } else {
      print("Question Remaining");
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
      "Answer": ["Blue", "Red", "Yellow", "Green"],
    },
    {
      "Question": "WHat is you fav Animal",
      "Answer": ["Cat", "Dog", "Cow"],
    },
    {
      "Question": "WHat is you fav Color3",
      "Answer": ["Red", "Yellow", "Green"],
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
            ? Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Text("${checkyou}"),
              FlatButton(
                onPressed: restart,
                child: Text(
                  "Restart",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ],
          ),
        )
            : Column(
          children:[
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
