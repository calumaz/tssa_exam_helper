import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tssa_exam_helper/models/quiz_bank.dart';
import 'package:tssa_exam_helper/widgets/question_page_view.dart';
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
  QuizPageContent({super.key, required this.quizBank}) {
    questionPageViews = GenerateQuestionPageViews();
  }

  QuizBank quizBank;
  late List<QuestionPageView> questionPageViews;

  @override
  State<QuizPageContent> createState() => _QuizPageContentState();

  List<QuestionPageView> GenerateQuestionPageViews() {
    List<QuestionPageView> results = [];
    for (Question question in quizBank.quizQuestions) {
      results.add(QuestionPageView(question: question));
    }

    return results;
  }
}

class _QuizPageContentState extends State<QuizPageContent> {
  int currentQuestionIndex = 0;
  int numberCorrent = 0;
  int numberIncorrect = 0;
  bool continueButtonIsVisible = false;
  final PageController pageController = PageController();
  var rng = Random();

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
                        '${currentQuestionIndex + 1}/20',
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

        // page content
        Expanded(
          child: PageView(
            children: widget.questionPageViews,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Continue'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
        )
      ],
    );
  }
}
