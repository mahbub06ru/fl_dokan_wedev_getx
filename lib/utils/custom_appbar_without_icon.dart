
import 'package:dokan/utils/text_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'image_constants.dart';

class CustomAppBarWithoutIcon extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onTap;
  final VoidCallback? onRightButtonTap;
   bool? automaticallyImplyLeading;

   CustomAppBarWithoutIcon({
    super.key,
    required this.title,
    required this.onTap,
    this.onRightButtonTap,
    this.automaticallyImplyLeading = true
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextBlack(
         text: title, textSize: 16.sp, fontWeight: FontWeight.w700
        ),
      ),
      centerTitle: false,
      actions: _buildActions(),
    );
  }
  List<Widget> _buildActions() {
    if (onRightButtonTap != null) {
      return [
        IconButton(
          onPressed: onRightButtonTap!,
          icon: SvgPicture.asset(
            ImageConstants.assetShape,
            width: 23.33.w,
            height: 23.33.h,
          ),
        ),
      ];
    } else {
      return [];
    }
  }
}

