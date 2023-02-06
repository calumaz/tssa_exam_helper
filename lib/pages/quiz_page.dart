import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tssa_exam_helper/models/quiz_bank.dart';
import '../widgets/answer_button.dart';
import '../widgets/stopwatch.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuizBank quizBank =
        ModalRoute.of(context)!.settings.arguments as QuizBank;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: QuizPageContent(quizBank: quizBank),
      )),
    );
  }
}

class QuizPageContent extends StatefulWidget {
  QuizBank quizBank;
  QuizPageContent({super.key, required this.quizBank});

  @override
  State<QuizPageContent> createState() => _QuizPageContentState();
}

class _QuizPageContentState extends State<QuizPageContent> {
  int numberCurrentQuestion = 1;
  int numberCorrent = 0;
  int numberIncorrect = 0;
  bool continueButtonIsVisible = false;
  late List<AnswerButton> currentAnswerButtons = widget.quizBank.answerButtons;
  var rng = Random();

  void updateAnswerButtons() {
    setState(() {
      currentAnswerButtons = widget.quizBank.generateAnswerButtons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // top row
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: 'tssa_logo',
                child: Image.asset(
                  'assets/images/tssa_logo.png',
                  height: 50,
                ),
              ),
              Column(
                children: [
                  Text(widget.quizBank.title,
                      style: const TextStyle(
                          fontSize: 20, fontFamily: 'Rajdhani')),
                  // questions remaining, # correct, # wrong
                  Row(
                    children: [
                      Text(
                        '$numberCurrentQuestion/20',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(numberCorrent.toString()),
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(numberIncorrect.toString()),
                      const Icon(Icons.close, color: Colors.red)
                    ],
                  )
                ],
              ),
              Container(width: 60, child: StopWatch())
            ],
          ),
        ),
        // card for question text
        Card(
            child: SizedBox(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.quizBank.quizQuestions[0].question,
              style: const TextStyle(fontSize: 20, fontFamily: 'Rajdhani'),
            ),
          ),
        )),
        // space for answer buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: currentAnswerButtons,
          ),
        )
      ],
    );
  }
}
