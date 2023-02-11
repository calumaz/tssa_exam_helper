import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tssa_exam_helper/quiz_questions/four_A_Questions.dart';
import 'package:tssa_exam_helper/widgets/answer_button.dart';

class QuizBank {
  QuizBank({required this.title, required this.quizQuestions}) {
    rng = Random();
    quizQuestions.shuffle();
  }
  String title;
  List<Question> quizQuestions;
  List<AnswerButton> answerButtons = [];
  int currentQuestionNumber = 0;
  dynamic rng;

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
