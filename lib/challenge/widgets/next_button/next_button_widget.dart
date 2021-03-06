import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {

  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final VoidCallback onTap;
  final Color borderColor;

  NextButtonWidget({Key? key,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.fontColor,
    required this.onTap
  })
      : super(key: key);

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.label = label,
        this.onTap = onTap;


  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.label = label,
        this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.label = label,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            side: MaterialStateProperty.all(BorderSide(
              color: borderColor,

            ))
        ),

        onPressed: onTap,
        child: Text(label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),),
      ),
    );
  }
}