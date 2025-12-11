import 'package:flutter/material.dart';

class OutlinedButtonStyle {
  // Default
  static final ButtonStyle defaultStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    side: BorderSide.none,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
