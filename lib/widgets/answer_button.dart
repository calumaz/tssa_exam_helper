import 'package:flutter/material.dart';
import '../pages/quiz_page.dart';

class AnswerButton extends StatefulWidget {
  AnswerButton(
      {super.key,
      required this.text,
      required this.isCorrectAnswer,
      this.nextQuestion});
  final Function? nextQuestion;
  final String text;
  final bool isCorrectAnswer;
  final ButtonStyle correctButtonStyle = OutlinedButton.styleFrom(
      side: BorderSide(width: 1.0, color: Colors.green));
  final ButtonStyle incorrectButtonStyle =
      OutlinedButton.styleFrom(side: BorderSide(width: 1.0, color: Colors.red));

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  ButtonStyle currentButtonStyle = OutlinedButton.styleFrom();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: currentButtonStyle,
        onPressed: () {
          setState(() {
            if (widget.isCorrectAnswer) {
              currentButtonStyle = widget.correctButtonStyle;
              widget.nextQuestion!();
            } else {
              currentButtonStyle = widget.incorrectButtonStyle;
            }
          });
        },
        child: Text(widget.text));
  }
}
