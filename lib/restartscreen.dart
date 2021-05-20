import 'package:flutter/material.dart';


class RestartPage extends StatelessWidget {
  String text;
  Function onPresssHandler;
  RestartPage({this.text, this.onPresssHandler });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Text("$text"),
          FlatButton(
            onPressed: onPresssHandler,
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
