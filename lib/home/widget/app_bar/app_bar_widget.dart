import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widget/score_card/score_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: (250),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 161,
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: "relooou",
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                          text: "Be",
                          style: AppTextStyles.titleBold
                      )
                    ]
                )),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(
                          "https://s2.glbimg.com/9IR4R_mbxE32M4j0lvNDwFzAYig=/0x0:1080x1347/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/1/O/iiWJBASiGz0kk8FdXuqA/gaga.jpg"
                      ))
                  ),
                )
              ],
            ),
          ),
          Align(alignment: Alignment(0.0, 1.0), child: ScoreCardWidget(),),
        ],
      ),
    ));
}
