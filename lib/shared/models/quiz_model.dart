import 'dart:convert';

import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';

enum Level { Facil, Medio, Dificil, Perito }
extension LevelStringExt on String{
  Level get parse => {
    "facil" : Level.Facil,
    "medio" : Level.Medio,
    "dificil" : Level.Dificil,
    "perito" : Level.Perito,
  }[this]!;
}

extension LevelExt on Level {
  String get parse => {
    Level.Facil:"facil",
    Level.Medio:"medio",
    Level.Dificil:"dificil",
    Level.Perito:"perito",
  }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagem,
    required this.level,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return new QuizModel(
      title: map['title'] as String,
      questions: List<QuestionModel>.from(map['questions']?.map((x) =>QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'] as int,
      imagem: map['imagem'] as String,
      level: map['level'].toString().parse as Level,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'questions': this.questions,
      'questionAnswered': this.questionAnswered,
      'imagem': this.imagem,
      'level': this.level.parse,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
