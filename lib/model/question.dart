import 'package:uuid/uuid.dart';

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
  }) : id = id ?? const Uuid().v4();
}
