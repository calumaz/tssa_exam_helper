import 'package:flutter/material.dart';
import '../pages/quiz_page.dart';

class AnswerButton extends StatefulWidget {
  AnswerButton(
      {super.key,
      required this.text,
      required this.isCorrectAnswer,
      required this.revealCorrectAnswer});

  final String text;
  final bool isCorrectAnswer;
  final Function revealCorrectAnswer;
  late Icon answerIcon = isCorrectAnswer
      ? Icon(
          Icons.check,
          color: Colors.green,
        )
      : Icon(
          Icons.close,
          color: Colors.red,
        );

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  RoundedRectangleBorder? cardShape;
  bool iconIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped');
        setState(() {
          if (widget.isCorrectAnswer) {
            cardShape = RoundedRectangleBorder(
                side: BorderSide(color: Colors.green.withOpacity(.8)));
            iconIsVisible = true;
          } else {
            cardShape = RoundedRectangleBorder(
                side: BorderSide(color: Colors.red.withOpacity(.8)));
            iconIsVisible = true;
            widget.revealCorrectAnswer();
          }
        });
      },
      child: Card(
          shape: cardShape,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Visibility(visible: iconIsVisible, child: widget.answerIcon)
                ],
              ),
            ),
          )),
    );
  }
}
