import 'package:dokan/controller/auth_controller.dart';
import 'package:dokan/features/home/screens/home_page.dart';
import 'package:dokan/features/sign_in/screens/sign_in_page.dart';
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController controller = Get.put(AuthController());
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
          child: Obx((){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),

                TextBlack(text: 'Sign Up', textSize: 25.sp,fontWeight: FontWeight.w600,),
                SizedBox(height: 24.h),
                AppTextField(
                  textInputType: TextInputType.text,
                  controller: controller.usernameTextEditingController.value,
                  labelText: 'Username',
                  hintText: 'Username',
                  prefixIcon: SvgPicture.asset(ImageConstants.assetEmail),
                ),
                SizedBox(height: 24.h),
                AppTextField(
                  textInputType: TextInputType.emailAddress,
                  controller: controller.emailTextEditingController.value,
                  labelText: 'Email',
                  hintText: 'Email',
                  prefixIcon: SvgPicture.asset(ImageConstants.assetEmail),
                ),
                SizedBox(height: 24.h),
                AppTextField(
                  textInputType: TextInputType.text,
                  obsecureText: _passwordVisible,
                  controller: controller.passwordTextEditingController.value,
                  labelText: 'Password',
                  hintText: 'Password',
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
                        ? const Icon(Icons.remove_red_eye_rounded)
                        : SvgPicture.asset(ImageConstants.assetEye),
                  ),
                ),
                SizedBox(height: 70.h),
                RoundedButtonColored(
                  text: 'Sign UP',
                  onPressed: () {
                    if(controller.usernameTextEditingController.value.text.isEmpty
                        || controller.emailTextEditingController.value.text.isEmpty
                        || controller.passwordTextEditingController.value.text.isEmpty){
                      Get.snackbar('Oops!', 'Need to fill all info');
                    }else{
                      controller.signUp();
                    }
                  },
                ),
                SizedBox(height: 70.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextGrey(text: 'Already have an account?', textSize: 14.sp),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Get.back();
                        Get.to(()=>SignInScreen());
                      },
                      child: const Text('Login', style: TextStyle(
                          color: Colors.blue
                      ),),
                    ),
                  ],
                ),

              ],
            );
          })
        ),
      ),
    );
  }

}
