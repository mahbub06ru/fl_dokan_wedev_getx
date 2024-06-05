import 'package:dokan/utils/custom_appbar.dart';
import 'package:dokan/utils/text_black.dart';
import 'package:dokan/utils/text_grey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/image_constants.dart';
import '../widgets/account_card.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title:  'Account Page',
        onTap: () {  },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child:   Obx((){
          return Column(
            children: [
              // Profile Picture
              Center(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey, // Set your desired border color
                      width: 2.0.w, // Set the border width
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      controller.avatar_urls.value,
                      fit: BoxFit.contain,
                      width: 92.0.w,
                      height: 92.0.h,
                    ),
                  ),
                ),
              ),

               SizedBox(height: 20.0.h),
              // User Name
              Text(
                controller.name.value.capitalizeFirst!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: AppConstants.appFont, // Use your app's font here
                  fontWeight: FontWeight.bold,
                ),
              ),
              // User Email
              Text(
                'mahbub06ru@gmail.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.appFont,
                ),
              ),
               SizedBox(height: 20.0.h),
              // Card with Expandable Items
              Card(
                elevation: 1.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                ),
                child: Column(
                  children:  [
                    ExpandableItem(title: 'Account', image: ImageConstants.assetGroup), // Replace with actual image path
                    ExpandableItem(title: 'Password', image: ImageConstants.assetPW), // Replace with actual image path
                    ExpandableItem(title: 'Notifications', image: ImageConstants.assetNoti), // Replace with actual image path
                    ExpandableItem(title: 'Wishlist', image: ImageConstants.assetHeart), // Replace with actual image path
                  ],
                ),
              ),
               SizedBox(height: 100.0.h),
            ],
          );
        }) ,
      ),
    );
  }
}

