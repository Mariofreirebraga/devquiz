import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {

  final String title;
  final int length;
  final int result;

  const ResultPage({Key? key, required this.title, required this.length, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        top: true,
        child: Container(
          padding: EdgeInsets.only(top: 100),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child:Image.asset(AppImages.trophy,fit: BoxFit.contain,),
              ),
              Column(
                children: [
                  Text("Parabéns (_*_)", style: AppTextStyles.heading40),
                  SizedBox(
                    height: 16,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Você conseguiu",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text: "\nfinalizou o quiz ${title}",
                            style: AppTextStyles.bodyBold),
                        TextSpan(
                            text: "\nAcertou $result de $length",
                            style: AppTextStyles.bodyBold),
                        TextSpan(
                          text: "\nContinue a nadar!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: NextButtonWidget.purple(
                            label: "Compartilhar",
                            onTap: () {
                              Share.share(" Olá esse e o meu primeiro app mobile funcionando e compartilhando bjs!!!");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              // Navigator.pop(context);
                            },
                            child: Text(
                              "Voltar ao inicio",
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}