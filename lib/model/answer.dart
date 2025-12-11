class Answer {
  final String choice;
  Answer({required this.choice});

  bool isCorrect(String goodChoice) {
    return choice == goodChoice;
  }
}
