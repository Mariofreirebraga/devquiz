import 'dart:convert';

import 'package:DevQuiz/shared/models/awnser_model.dart';

class QuestionModel{
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({required this.title,required this.awnsers}) : assert(
         awnsers.length == 4,
  );

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return new QuestionModel(
      title: map['title'] as String,
      awnsers: List<AwnserModel>.from(
      map['awnsers']?.map((x) => AwnserModel.fromMap(x))) as List<AwnserModel>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'awnsers': this.awnsers,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));

}