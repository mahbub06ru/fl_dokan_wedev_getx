import 'package:dokan/utils/app_text_field.dart';
import 'package:dokan/utils/rounded_button_colored.dart';
import 'package:dokan/utils/rounded_button_grey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/image_constants.dart';

class UpdateUserPage extends StatelessWidget {
  final AuthController userController = Get.put(AuthController());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (userController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                firstNameController.text = userController.firstName.value;
                lastNameController.text = userController.lastName.value;
                return Column(
                  children: [
                    AppTextField(
                      textInputType: TextInputType.text,
                      controller: firstNameController,
                      labelText: 'First Name',
                      hintText: 'First Name',
                      prefixIcon: SvgPicture.asset(ImageConstants.assetGroup,color: Colors.grey,),
                    ),
                    SizedBox(height: 10.w,),
                    AppTextField(
                      textInputType: TextInputType.text,
                      controller: lastNameController,
                      labelText: 'Last Name',
                      hintText: 'Last Name',
                      prefixIcon: SvgPicture.asset(ImageConstants.assetGroup,color: Colors.grey,),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: RoundedButtonGrey(text: 'Cancel', onPressed:  () {

                        },)),
                        SizedBox(width: 10.w,),
                        Expanded(child: RoundedButtonColored(text: 'Save', onPressed:  () {
                          String firstName = firstNameController.text.trim();
                          String lastName = lastNameController.text.trim();
                          if (firstName.isNotEmpty && lastName.isNotEmpty) {
                            userController.updateUserInfo(firstName, lastName);
                          } else {
                            Get.snackbar('Error', 'Please enter all fields');
                          }
                        },))

                      ],
                    ),

                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
