import 'package:flutter/material.dart';
import './quiz_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your Score",
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Text("$score/$totalQuestions",
              style: TextStyle(fontSize: 30.0, color: Colors.black)),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 100.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (b) => QuizPage()),
                (Route route) => route == null),
          )
        ],
      ),
    );
  }
}
