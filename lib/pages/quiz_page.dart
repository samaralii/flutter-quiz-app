import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  Questions currentQuestion;
  Quiz quiz = new Quiz([
    Questions("Elon musk is human?", false),
    Questions("Pizza is healthy?", false),
    Questions("flutter is awesome?", true)
  ]);

  String questionText;
  int questionsNumber;
  bool isCorrect;
  bool overlayShouldVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestions;
    questionText = currentQuestion.questions;
    questionsNumber = quiz.questionsNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),
            QuestionText(questionText, questionsNumber),
            AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldVisible == true
            ? CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == questionsNumber) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (b) => ScorePage(quiz.score, quiz.length)),
                      (Route route) => route == null);
                  return;
                }

                currentQuestion = quiz.nextQuestions;
                this.setState(() {
                  overlayShouldVisible = false;
                  questionText = currentQuestion.questions;
                  questionsNumber = quiz.questionsNumber;
                });
              })
            : Container()
      ],
    );
  }
}
