
import 'package:dokan/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'image_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onTap;
  final VoidCallback? onRightButtonTap;
   bool? automaticallyImplyLeading;
  List<Widget>? buildActions;

   CustomAppBar({
    super.key,
    required this.title,
    required this.onTap,
    this.onRightButtonTap,
    this.automaticallyImplyLeading = true,
     this.buildActions
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading!,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        // onTap: onTap,
        onTap: onTap,
        child: Padding(
          padding:  EdgeInsets.all(20.0.w),
          child: SvgPicture.asset(
            ImageConstants.assetShape,
            // width: 6.w,
            // height: 6.h,
          ),
        ),
      ),
      title: Text(
        title,
        style:  TextStyle(
          color: Colors.black,
          fontSize: 23.sp,
          fontFamily: AppConstants.appFont,
          fontWeight: FontWeight.w700,
        ),
      ),

      actions: buildActions,
    );
  }
  List<Widget> _buildActions() {
    if (onRightButtonTap != null) {
      return [
        IconButton(
          onPressed: onRightButtonTap!,
          icon: SvgPicture.asset(
            ImageConstants.assetShape,
            height: 24.h, // Adjust height as needed
            width: 24.w, // Adjust width as needed
          ),
        ),
      ];
    } else {
      return [];
    }
  }
}

