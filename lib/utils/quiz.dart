import 'questions.dart';

class Quiz {
  List<Questions> _questions;
  int _currentQuestionsIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Questions> get questions => _questions;
  int get length => _questions.length;
  int get questionsNumber => _currentQuestionsIndex + 1;
  int get score => _score;

  Questions get nextQuestions {
    _currentQuestionsIndex++;
    if (_currentQuestionsIndex >= _questions.length) return null;

    return _questions[_currentQuestionsIndex];
  }

  void answer(bool isCorrect){
    if(isCorrect) _score++;
  }

  
}
