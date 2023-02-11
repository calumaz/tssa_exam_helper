import 'package:flutter/material.dart';
import 'package:tssa_exam_helper/pages/quiz_page.dart';
import 'package:tssa_exam_helper/quiz_questions/four_A_Questions.dart';
import '../models/quiz_bank.dart';

class ExamSelectionButton extends StatelessWidget {
  String label;
  bool isEnabled;

  ExamSelectionButton(this.label, {this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //TODO: change function so that the arguments are dynamic for each button
        isEnabled
            ? Navigator.pushNamed(context, 'quiz', arguments: fourAQuestions)
            : null;
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: Text(label),
    );
  }
}
