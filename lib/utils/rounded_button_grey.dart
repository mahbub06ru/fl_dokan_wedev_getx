
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RoundedButtonGrey extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;

   const RoundedButtonGrey({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.grey, // Changed to pink color
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8; // Adjust button width as needed
    double buttonHeight = 54; // Set the default height

    return Container(
      width: double.infinity,
      height: 54.h,
      // padding:  EdgeInsets.symmetric(horizontal: 32.w, vertical: 17.h),
      decoration: ShapeDecoration(
        color: Color(0xFFF5F5F8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Color(0xFFF5F5F8)),
            foregroundColor: WidgetStateProperty.all(Color(0xFFF5F5F8)),
            padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: 14.h,horizontal: 30.w)),
            textStyle: WidgetStateProperty.all(TextStyle(
              color: Color(0xFF757D85),
              fontSize: 14.sp,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ))),
        child:  Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF757D85),
            fontSize: 14,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,

          ),
        ),
      ),
    );
    /*return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
        decoration: ShapeDecoration(
          color:  const Color(0xFFF5F5F8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style:   TextStyle(
                color: const Color(0xFF757D85),
                fontSize: AppUtils.responsiveFontSize(context, 15),
                fontFamily: Constants.fontUrbanist,
                fontWeight: FontWeight.w500,
                height: 0.11,
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}

