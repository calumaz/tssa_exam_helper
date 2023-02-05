import 'package:tssa_exam_helper/quiz_questions/four_A_Questions.dart';

class QuizBank {
  QuizBank({required this.title, required this.quizQuestions}) {
    quizQuestions.shuffle();
  }
  String title;
  List<Question> quizQuestions;
}

class Question {
  Question(
      {required this.question,
      required this.correctAnswer,
      required this.wrongAnswers});

  String question;
  String correctAnswer;
  List<String> wrongAnswers;
}

enum AvailableQuizzes { fourA, fourB }
