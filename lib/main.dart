import 'package:dokan/home_page.dart';
import 'package:dokan/update_user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/update', page: () => UpdateUserPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
