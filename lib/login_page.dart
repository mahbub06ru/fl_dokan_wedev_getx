import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';


class LoginPage extends StatelessWidget {
  final AuthController loginController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => loginController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                String username = usernameController.text.trim();
                String password = passwordController.text.trim();
                if (username.isNotEmpty && password.isNotEmpty) {
                  loginController.login(username, password);
                } else {
                  Get.snackbar('Error', 'Please enter all fields');
                }
              },
              child: Text('Login'),
            )),
            Obx(() => loginController.userId.value.isNotEmpty
                ? Column(
              children: [
                Text('User ID: ${loginController.userId.value}'),
                Text('First Name: ${loginController.firstName.value}'),
                Text('Last Name: ${loginController.lastName.value}'),
              ],
            )
                : Container()),
          ],
        ),
      ),
    );
  }
}
