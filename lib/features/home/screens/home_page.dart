import 'dart:io';

import 'package:dokan/utils/app_colors.dart';
import 'package:dokan/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'product_page.dart';
import '../../profile/screens/account_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Do you want to exit?"),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            exit(0);
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appColor, // Change the background color here
                        ),
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appColor, // Change the background color here
                        ),
                        child: const Text("No", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: CurvedNavBar(
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
          AccountPage(),
        ],
        actionBarView: Container(
          height: 66.h,
          color: Colors.white54,
        ),
      ),
    );
  }
}
