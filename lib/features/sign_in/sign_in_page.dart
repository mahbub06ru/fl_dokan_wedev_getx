import 'package:dokan/utils/image_constants.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_text_field.dart';
import '../../utils/rounded_button_colored.dart';
import '../../utils/text_app_color.dart';
import '../../utils/text_black.dart';
import '../../utils/text_grey.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailTextEditingController = TextEditingController();
  var passwordTextEditingController = TextEditingController();
  var _passwordVisible = true;

  @override
  void initState() {
    // emailTextEditingController = TextEditingController(text: 'mahbub06ru@gmail.com');
    // passwordTextEditingController = TextEditingController(text: '123456');
    super.initState();
  }

  @override
  void dispose() {
    // imageCache.clear();
    // imageCache.clearLiveImages();
    // Dispose of the controller when the widget is disposed.

    // controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 250.h),
              bodyInput(context),
              RoundedButtonColored(
                text: 'Sign In',
                onPressed: () {
                  // Get.back();
                  // Get.to( HomePage());
                },
              ),
              SizedBox(height: 140.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBlack(text: 'Constants.InterestedToWork', textSize: 14.sp,fontWeight: FontWeight.w400,),
                  TextAppColored(text: 'Constants.joinUs', textSize: 18.sp,fontWeight: FontWeight.w700,),
                ],
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyInput(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBlack(text: 'Welcome Back!', textSize: 24.sp,fontWeight: FontWeight.w600,),
        TextGrey(text: 'Hello there, please login first 👋', textSize: 14.sp,fontWeight: FontWeight.w400),
        SizedBox(height: 24.h),
        AppTextField(
          textInputType: TextInputType.emailAddress,
          controller: emailTextEditingController,
          labelText: 'Email',
          hintText: 'Email',
          prefixIcon: SvgPicture.asset(ImageConstants.assetGroup),
        ),
        SizedBox(height: 24.h),
        AppTextField(
          textInputType: TextInputType.text,
          obsecureText: _passwordVisible,
          controller: passwordTextEditingController,
          labelText: 'Password',
          hintText: 'Password',
          prefixIcon: Padding(
            padding:  EdgeInsets.only(left: 8.0.r),
            child: SvgPicture.asset(ImageConstants.assetGroup),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            child: _passwordVisible
                ? SvgPicture.asset(ImageConstants.assetGroup)
                : SvgPicture.asset(ImageConstants.assetGroup),
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
