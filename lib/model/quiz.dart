import 'package:quiz_flutter_app/model/answer.dart';
import 'package:quiz_flutter_app/model/question.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({required this.questions, required this.answers});
}
