import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/ui/screens/quiz_screen/layout.dart';
import 'package:quiz_flutter_app/ui/screens/welcome_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool isStarted = false;

  void onStarted(bool newValue) {
    setState(() {
      isStarted = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isStarted ? QuizLayout() : WelcomeScreen(onChanged: onStarted);
  }
}
