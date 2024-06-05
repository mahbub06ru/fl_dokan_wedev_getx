import 'package:dokan/utils/image_constants.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_text_field.dart';
import '../../../utils/rounded_button_colored.dart';
import '../../../utils/text_app_color.dart';
import '../../../utils/text_black.dart';
import '../../../utils/text_grey.dart';
import '../../sign_up/pages/profile_update_page.dart';
import '../../sign_up/pages/sign_up_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                SvgPicture.asset(ImageConstants.assetLogo),
                SizedBox(height: 50.h),
                TextBlack(text: 'Sign In', textSize: 25.sp,fontWeight: FontWeight.w600,),
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
                        ? const Icon(Icons.remove_red_eye_rounded,color: Colors.grey,)
                        : SvgPicture.asset(ImageConstants.assetEye),
                  ),
                ),
                SizedBox(height: 70.h),
                RoundedButtonColored(
                  text: 'Sign In',
                  onPressed: () {
                    if(controller.usernameTextEditingController.value.text.trim().isEmpty
                        || controller.passwordTextEditingController.value.text.trim().isEmpty ){
                      Get.snackbar('Oops!', 'Need to fill all info');
                    }else{
                      controller.login();
                    }

                  },
                ),
                SizedBox(height: 50.h),
                InkWell(onTap:(){
                  Get.back();
                  Get.to(()=> SignUpPage());
                },child: TextGrey(text: 'Create New Account', textSize: 14.sp))

              ],
            ),
          ),
        ),
      ),
    );
  }

}
