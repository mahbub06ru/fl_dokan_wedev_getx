import 'package:dokan/product_page.dart';
import 'package:dokan/update_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/home/home_page.dart';
import 'features/sign_up/profile_update_page.dart';
import 'features/sign_in/sign_in_page.dart';
import 'login_page.dart';

//resources
/*
https://docs.google.com/document/d/14RnMdTuIMUACR4yXEnM0af0gsvbHOeYESV-nrjPzJ6E/edit
https://www.figma.com/file/lHDVMCVsE6R3NWxxG6Wfbo/Demo?node-id=0%3A1
 */

void main() {
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