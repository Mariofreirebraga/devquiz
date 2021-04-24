import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/home/widget/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {

  final statenotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => statenotifier.value = state;
  HomeState get state => statenotifier.value;

  final repository = HommeRepository();

  //USER
  //QUIZZES
  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;

  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
