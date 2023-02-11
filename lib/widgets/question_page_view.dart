import 'dart:math';

import 'package:flutter/material.dart';

import '../models/quiz_bank.dart';
import 'answer_button.dart';

class QuestionPageView extends StatefulWidget {
  QuestionPageView({super.key, required this.question}) {
    question.wrongAnswers.shuffle();

    // insert incorrect answers (this value can be zero)
    for (int i = 0; i < staggerAmount; i++) {
      shuffledAnswerList.add(AnswerButton(
        text: question.wrongAnswers[i],
        isCorrectAnswer: false,
        revealCorrectAnswer: revealCorrectAnswer,
      ));
    }
    // insert correct answer
    // TODO: add a function here unique for correct answer
    shuffledAnswerList.add(AnswerButton(
      text: question.correctAnswer,
      isCorrectAnswer: true,
      revealCorrectAnswer: revealCorrectAnswer,
      // insert remaining incorrect answers
    ));
    for (int i = staggerAmount; i < numberOfAnswers; i++) {
      shuffledAnswerList.add(AnswerButton(
        text: question.wrongAnswers[i],
        isCorrectAnswer: false,
        revealCorrectAnswer: revealCorrectAnswer,
      ));
    }
  }

  final Question question;
  final dynamic rng = Random();
  late int staggerAmount = rng.nextInt(numberOfAnswers + 1);
  late int numberOfAnswers = question.wrongAnswers.length;
  List<AnswerButton> shuffledAnswerList = [];

  void revealCorrectAnswer() {
    print('looking for correct answer');
  }

  @override
  State<QuestionPageView> createState() => _QuestionPageViewState();
}

class _QuestionPageViewState extends State<QuestionPageView> {
  // this function is called by a button when an answer is selected. reveals correct answer if not chosen, changes color variable

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
            child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.question.question,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.shuffledAnswerList,
        )
      ],
    );
  }
}
