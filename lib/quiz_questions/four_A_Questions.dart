import '../models/quiz_bank.dart';

QuizBank fourAQuestions = QuizBank(title: '4A Quiz Questions', quizQuestions: [
  Question(
      question: 'what is 1 + 3?',
      correctAnswer: '4',
      wrongAnswers: ['1', '2', '3', '5']),
  Question(
      question: 'what is 1 + 2?',
      correctAnswer: '3',
      wrongAnswers: ['1', '2', '4', '5']),
  Question(
      question: 'what is 2 + 2?',
      correctAnswer: '4',
      wrongAnswers: ['1', '2', '3', '5']),
]);
