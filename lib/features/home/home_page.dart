import 'package:dokan/utils/app_colors.dart';
import 'package:dokan/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../product_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          onTab: (value) {
            /// perform action here
            print(value);
          },
          activeIcon: Container(
            padding: EdgeInsets.all(10.w),
            decoration:
                const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: SvgPicture.asset(ImageConstants.assetShape,  color: AppColors.primary,)
          ),
          inActiveIcon: Container(
            padding: EdgeInsets.all(10.w),
            decoration:
                const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            child: SvgPicture.asset(ImageConstants.assetShape,  color: Colors.white,)
          ),
          text: ""),
      activeColor: AppColors.primary,
      navBarBackgroundColor: Colors.white,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: SvgPicture.asset(ImageConstants.assetPath,  color: AppColors.primary,),
            inActiveIcon: SvgPicture.asset(ImageConstants.assetPath,  color: Colors.black26,),
            text: ''),
        FABBottomAppBarItem(
            activeIcon: SvgPicture.asset(ImageConstants.assetCombShape,  color: AppColors.primary,),
            inActiveIcon: SvgPicture.asset(ImageConstants.assetCombShape,  color: Colors.black26,),
            text: ''),
        FABBottomAppBarItem(
            activeIcon: SvgPicture.asset(ImageConstants.assetShape1,  color: AppColors.primary,),
            inActiveIcon: SvgPicture.asset(ImageConstants.assetShape1,  color: Colors.black26,),
            text: ''),
        FABBottomAppBarItem(
            activeIcon: SvgPicture.asset(ImageConstants.assetGroup,  color: AppColors.primary,),
            inActiveIcon: SvgPicture.asset(ImageConstants.assetGroup,  color: Colors.black26,),
            text: ''),
      ],
      bodyItems: [
        ProductPage(),
        ProductPage(),
        ProductPage(),
        ProductPage(),
      ],
      actionBarView: Container(
        height: 66.h,
        color: Colors.white54,
      ),
    );
  }
}
