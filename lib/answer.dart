import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Function onPressHandler;
  String answer;
  Answer(this.onPressHandler, this.answer);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        answer,
        style: TextStyle(fontSize: 12, color: Colors.pinkAccent),
      ),
      color: Colors.white,
      elevation: 10,
      onPressed: onPressHandler,
    );
  }
}
