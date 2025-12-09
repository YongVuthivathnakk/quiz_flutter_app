import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/ui/screens/welcome_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}