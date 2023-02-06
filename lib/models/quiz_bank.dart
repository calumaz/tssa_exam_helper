import 'dart:math';
import 'package:tssa_exam_helper/quiz_questions/four_A_Questions.dart';
import 'package:tssa_exam_helper/widgets/answer_button.dart';

class QuizBank {
  QuizBank({required this.title, required this.quizQuestions}) {
    rng = Random();
    quizQuestions.shuffle();
    answerButtons = generateAnswerButtons();
  }
  String title;
  List<Question> quizQuestions;
  List<AnswerButton> answerButtons = [];
  int currentQuestionNumber = 0;
  dynamic rng;

  // shuffle the order in answer buttons are returned and increments the currentQuestionNumber
  List<AnswerButton> generateAnswerButtons() {
    Question question = quizQuestions[currentQuestionNumber];
    List<AnswerButton> currentAnswerButtons = [];
    int numberOfAnswers = question.wrongAnswers.length;
    int staggerAmount = rng.nextInt(numberOfAnswers + 1);

    question.wrongAnswers.shuffle();

    for (int i = 0; i < staggerAmount; i++) {
      currentAnswerButtons.add(AnswerButton(
        text: question.wrongAnswers[i],
        isCorrectAnswer: false,
        nextQuestion: () {},
      ));
    }
    // insert correct answer
    currentAnswerButtons.add(AnswerButton(
      text: question.correctAnswer,
      isCorrectAnswer: true,
      nextQuestion: () {},
    ));
    for (int i = staggerAmount; i < numberOfAnswers; i++) {
      currentAnswerButtons.add(AnswerButton(
        text: question.wrongAnswers[i],
        isCorrectAnswer: false,
        nextQuestion: () {},
      ));
    }

    // increment the current question before returning list of buttons
    currentQuestionNumber++;
    return currentAnswerButtons;
  }
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
