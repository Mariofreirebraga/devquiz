import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int qtdAwnserRigth = 0;

  int get currentPage => currentPageNotifier.value;

  set currentPage(int value) => currentPageNotifier.value = value;
}