import 'package:DevQuiz/core/app_widget.dart';
import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: AppWidget(),
    );
  }
}

