import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/data/questions.dart';
import 'package:quiz_flutter_app/model/answer.dart';
import 'package:quiz_flutter_app/model/quiz.dart';
import 'package:quiz_flutter_app/ui/screens/quiz_screen/quiz_screen.dart';
import 'package:quiz_flutter_app/ui/screens/result_screen.dart';

class QuizLayout extends StatefulWidget {
  const QuizLayout({super.key});

  @override
  State<QuizLayout> createState() => _QuizLayoutState();
}

class _QuizLayoutState extends State<QuizLayout> {
  late Quiz quiz;
  int questionIndex = 0;
  bool isResult = false;
  bool isRestart = false;

  @override
  void initState() {
    super.initState();

    quiz = Quiz(
      questions: questions,
      answers: List.generate(questions.length, (index) => Answer(choice: "")),
    );
  }

  void onRestart() {
    setState(() {
      isRestart = true;
      isResult = false;
      quiz = Quiz(
        questions: questions,
        answers: List.generate(questions.length, (index) => Answer(choice: "")),
      );
      questionIndex = 0;
    });
  }

  void onAnswer(String newChoice) {
    quiz.answers[questionIndex] = Answer(choice: newChoice);

    if (questionIndex == quiz.questions.length - 1) {
      setState(() {
        isResult = true;
      });
    } else {
      setState(() {
        questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isResult
        ? ResultScreen(quiz: quiz, onTap: onRestart)
        : QuizScreen(question: quiz.questions[questionIndex], onTap: onAnswer);
  }
}
