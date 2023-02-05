import 'package:flutter/material.dart';
import '../widgets/exam_selection_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Hero(
            tag: 'tssa_logo',
            child: Image.asset(
              'assets/images/tssa_logo.png',
              height: 200,
            ),
          ),
          Column(
            children: const [
              Text(
                'Exam Practice',
                style: TextStyle(fontSize: 30),
              ),
              Text('4th Class Power Engineer',
                  style: TextStyle(fontSize: 30, fontFamily: 'Rajdhani'))
            ],
          ),
          Column(
            children: [
              ExamSelectionButton('4A Practice Exam'),
              ExamSelectionButton('4B Practice Exam'),
              ExamSelectionButton('Placeholder')
            ],
          ),
        ],
      ))),
    );
  }
}
