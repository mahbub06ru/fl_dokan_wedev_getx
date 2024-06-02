import 'package:dokan/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final bool enableInteractiveSelection;
  final String? headingText;
  final String? hintText;
  final String? labelText;
  final bool obsecureText;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextAlign? textAlign;
  final bool? readOnly;

  AppTextField({
    Key? key,
    this.onTap,
    this.enableInteractiveSelection = true,
    this.enabled,
    this.headingText,
    this.hintText,
    this.obsecureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.textInputAction,
    required this.controller,
    this.maxLines = 1,
    this.validator,
    this.focusNode,
    this.onChanged,
    this.textAlign,
    this.readOnly,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        obscureText: obsecureText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontFamily: AppConstants.appFont,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          prefixIcon: prefixIcon != null
              ? Container(
            width: 16.67.w, // Set the width of the prefix icon
            height: 14.17.h, // Set the height of the prefix icon
            alignment: Alignment.center, // Center the icon within the container
            child: prefixIcon,
          )
              : null,
          suffixIcon:  suffixIcon != null
              ? Container(
            width: 16.67.w, // Set the width of the prefix icon
            height: 14.17.h, // Set the height of the prefix icon
            alignment: Alignment.center, // Center the icon within the container
            child: suffixIcon,
          )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            color: Color(0xFF7E8BA0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3.r), // Custom underline when enabled
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3.r), // Custom underline when focused
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3.r), // Custom underline when error
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3.r), // Custom underline when disabled
          ),
        ),
      ),
    );
  }
}

