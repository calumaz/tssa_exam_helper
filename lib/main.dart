import 'package:flutter/material.dart';
import 'package:tssa_exam_helper/pages/home_page.dart';
import 'package:tssa_exam_helper/pages/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'quiz': (context) => QuizPage()
        },
        darkTheme: ThemeData.dark());
  }
}
