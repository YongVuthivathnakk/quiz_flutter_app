import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/ui/widgets/outline_button_style.dart';

class RestartButton extends StatelessWidget {
  final VoidCallback onTap;

  const RestartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 50,

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
          "Restart Quiz",
          style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
        ),
      ),
    );
    ;
  }
}
