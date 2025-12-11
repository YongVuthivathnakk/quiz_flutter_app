import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/ui/widgets/outline_button_style.dart';

class AnswerButton extends StatelessWidget {
  final String choice;
  final VoidCallback onTap;

  const AnswerButton({super.key, required this.choice, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 50,
      margin: EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(2, 5),
          ),
        ],
      ),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButtonStyle.defaultStyle,
        child: Text(
          choice,
          style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
        ),
      ),
    );
    ;
  }
}
