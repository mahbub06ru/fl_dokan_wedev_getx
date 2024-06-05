import 'package:dokan/features/home/screens/home_page.dart';
import 'package:dokan/utils/image_constants.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_text_field.dart';
import '../../../utils/rounded_button_colored.dart';
import '../../../utils/text_app_color.dart';
import '../../../utils/text_black.dart';
import '../../../utils/text_grey.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),

              TextBlack(text: 'Sign Up', textSize: 25.sp,fontWeight: FontWeight.w600,),
              SizedBox(height: 24.h),
              AppTextField(
                textInputType: TextInputType.emailAddress,
                controller: emailTextEditingController,
                labelText: 'First Name',
                hintText: 'First Name',
                prefixIcon: SvgPicture.asset(ImageConstants.assetEmail),
              ),
              SizedBox(height: 24.h),
              AppTextField(
                textInputType: TextInputType.text,
                obsecureText: _passwordVisible,
                controller: passwordTextEditingController,
                labelText: 'Last Name',
                hintText: 'Last Name',
                prefixIcon: Padding(
                  padding:  EdgeInsets.only(left: 8.0.r),
                  child: SvgPicture.asset(ImageConstants.assetPW),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: _passwordVisible
                      ? Icon(Icons.remove_red_eye_rounded)
                      : SvgPicture.asset(ImageConstants.assetEye),
                ),
              ),
              SizedBox(height: 70.h),
              RoundedButtonColored(
                text: 'Sign UP',
                onPressed: () {
                  Get.back();
                  Get.to(()=> MyHomePage());
                },
              ),
              SizedBox(height: 70.h),

              Row(
                children: [
                  TextGrey(text: 'Already have an account?', textSize: 14.sp),
                  SizedBox(width: 5,),
                  Text('Login', style: TextStyle(
                      color: Colors.blue
                  ),),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}
