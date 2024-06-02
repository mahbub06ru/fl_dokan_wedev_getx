
import 'package:dokan/utils/app_constants.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';


class TextAppColored extends StatelessWidget {
  final String text;
  final double textSize;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;
  final String? fontFamily;
  final bool? softWrap=false;
  final FontWeight? fontWeight;



  TextAppColored({required this.text,  required this.textSize, this.color,
        this.textAlign, this.fontFamily, this.overflow, this.maxLine,  this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        color: AppColors.primary,
        fontSize: textSize,
        fontFamily:AppConstants.appFont,
        fontWeight: fontWeight,
      ),
    );
  }
}