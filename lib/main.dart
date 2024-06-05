import 'package:dokan/features/home/screens/product_page.dart';
import 'package:dokan/update_user_page.dart';
import 'package:dokan/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/home/screens/home_page.dart';
import 'features/sign_up/pages/profile_update_page.dart';
import 'features/sign_in/screens/sign_in_page.dart';
import 'login_page.dart';
import 'utils/custom_aanimationn.dart';

//resources
/*
https://docs.google.com/document/d/14RnMdTuIMUACR4yXEnM0af0gsvbHOeYESV-nrjPzJ6E/edit
https://www.figma.com/file/lHDVMCVsE6R3NWxxG6Wfbo/Demo?node-id=0%3A1
 */
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = AppColors.primary
    ..indicatorColor = Colors.black
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}
void main() {
  configLoading();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return ScreenUtilInit(
        designSize:  const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            // initialRoute: '/',
            initialRoute: '/SignInScreen',
            getPages: [
              GetPage(name: '/', page: () => LoginPage()),
              GetPage(name: '/SignInScreen', page: () => SignInScreen()),
              GetPage(name: '/update', page: () => UpdateUserPage()),
              GetPage(name: '/home', page: () => ProductPage()),
              GetPage(name: '/MyHomePage', page: () => MyHomePage()),
              GetPage(name: '/ProfileUpdatePage', page: () => ProfileUpdatePage()),
            ],
          );
        });
  }
}