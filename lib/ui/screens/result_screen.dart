import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/model/answer.dart';
import 'package:quiz_flutter_app/model/question.dart';
import 'package:quiz_flutter_app/model/quiz.dart';
import 'package:quiz_flutter_app/ui/widgets/restart_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onTap;
  const ResultScreen({super.key, required this.quiz, required this.onTap});

  int getPoints() {
    int points = 0;
    for (int i = 0; i < quiz.questions.length; i++) {
      final question = quiz.questions[i];
      final answer = quiz.answers[i];

      if (answer.isCorrect(question.goodChoice)) {
        points++;
      }
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "You Answered ${getPoints()} on ${quiz.questions.length}",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),

                SizedBox(height: 100),

                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: quiz.questions.length,
                      itemBuilder: (context, index) {
                        final question = quiz.questions[index];
                        final answer = quiz.answers[index];
                        return QuestionCard(
                          question: question,
                          answer: answer,
                          index: index + 1,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 100),

                RestartButton(onTap: onTap),
                SizedBox(height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final Question question;
  final Answer answer;
  final int index;

  const QuestionCard({
    super.key,
    required this.question,
    required this.answer,
    required this.index,
  });

  bool isGoodChoice(String choice, String goodChoice) {
    return choice == goodChoice;
  }

  List<Widget> getChoices() {
    return question.choices
        .map(
          (choice) => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 5,
            children: [
              SizedBox(width: 20),
              isGoodChoice(choice, question.goodChoice)
                  ? Icon(Icons.check, size: 24)
                  : SizedBox(width: 24),
              Text(
                choice,
                style: TextStyle(
                  color: answer.choice != choice
                      ? Colors.black
                      : answer.isCorrect(question.goodChoice)
                      ? Colors.lightGreen.shade500
                      : Colors.red,
                  fontWeight: answer.choice == choice
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: answer.isCorrect(question.goodChoice)
                      ? Colors.lightGreen.shade500
                      : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 25,
                height: 25,
                child: Center(
                  child: Text("$index", style: TextStyle(color: Colors.white)),
                ),
              ),
              Text(
                question.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),

          ...getChoices(),
        ],
      ),
    );
  }
}
