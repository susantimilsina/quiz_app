import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String question;
  QuestionText(this.question);
  //shorthand

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(question,
        textAlign: TextAlign.center,
        style: TextStyle(
        color: Colors.blue,
        fontSize: 25,
      ),),
    );
  }
}
