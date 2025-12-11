import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/model/question.dart';
import 'package:quiz_flutter_app/ui/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final ValueChanged<String> onTap;

  const QuizScreen({super.key, required this.question, required this.onTap});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> getChoices() {
    return widget.question.choices
        .map(
          (choice) => AnswerButton(
            choice: choice,
            onTap: () {
              widget.onTap(choice);
            },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.question.title,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),

              SizedBox(height: 60),

              ...getChoices(),
            ],
          ),
        ),
      ),
    );
  }
}
