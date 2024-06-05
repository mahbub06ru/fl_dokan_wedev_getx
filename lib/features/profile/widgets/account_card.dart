import 'package:dokan/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../update_user_page.dart';

class ExpandableItem extends StatelessWidget {
  final String title;
  final String image;

  const ExpandableItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          SvgPicture.asset(image,  color: Colors.grey,),
          SizedBox(width: 10.w),
          Text(
            title,
            style:  TextStyle(
              fontSize: 16.0.sp,
              color: Colors.grey,
              fontFamily: AppConstants.appFont,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: UpdateUserPage(),
        ),
      ],
    );
  }
}