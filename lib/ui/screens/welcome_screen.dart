import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/ui/widgets/start_button.dart';

class WelcomeScreen extends StatelessWidget {
  final isStarted = false;
  final ValueChanged<bool> onChanged;

  const WelcomeScreen({super.key, required this.onChanged});

  void handleTap() {
    onChanged(!isStarted);
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
              Image(
                image: AssetImage("assets/images/quiz-logo.png"),
                width: 400,
                height: 400,
              ),
              SizedBox(height: 200),
              StartButton(onTap: handleTap),
            ],
          ),
        ),
      ),
    );
  }
}
