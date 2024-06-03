
import 'package:dokan/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';


class RoundedButtonColored extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;

  const RoundedButtonColored({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary, // Changed to pink color
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 61.h,
        padding:  EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child:  Text(
          text,
          textAlign: TextAlign.center,
          style:   TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontFamily: AppConstants.appFont,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

