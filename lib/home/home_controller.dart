import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/home/widget/home_state.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {

  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;


  //USER
  UserModel? user;

  //QUIZES
  List<QuizModel>? quizzes;

  final repository = HommeRepository();

  void getUser() async {

    state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 2));

    user = await repository.getUser();

    state = HomeState.success;
  }

  void getQuizzes() async {

    state = HomeState.loading;

    quizzes = await repository.getQuizzes();

    state = HomeState.success;
  }
}