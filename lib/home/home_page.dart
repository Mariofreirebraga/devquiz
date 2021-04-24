import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/widget/app_bar/app_bar_widget.dart';
import 'package:DevQuiz/home/widget/home_state.dart';
import 'package:DevQuiz/home/widget/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widget/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();


  @override
  void initState() {
super.initState();
controller.getUser();
controller.getQuizzes();
controller.statenotifier.addListener(() {
  setState(() {

  });
});
  }

  @override
  Widget build(BuildContext context) {
    if(controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: 'Fácil',),
                  LevelButtonWidget(label: 'Médio',),
                  LevelButtonWidget(label: 'Difícil',),
                  LevelButtonWidget(label: 'Perito',),
                ],
              ), SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children:
                  controller.quizzes!.map((e) =>
                      QuizCardWidget(
                        title: e.title,
                        percent: e.questionAnswered / e.questions.length,

                        completed: "${e.questionAnswered}/${e
                            .questions.length}",
                        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ChallengerPage(questions: e.questions,)));},
                      )).toList(),

                ),
              ),
            ],
          ),
        ),
      );
    }else {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),),),
      );
    }
  }
}
