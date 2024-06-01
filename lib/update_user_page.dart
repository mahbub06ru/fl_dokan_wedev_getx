import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';

class UpdateUserPage extends StatelessWidget {
  final AuthController userController = Get.put(AuthController());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              if (userController.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                firstNameController.text = userController.firstName.value;
                lastNameController.text = userController.lastName.value;
                return Column(
                  children: [
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String firstName = firstNameController.text.trim();
                        String lastName = lastNameController.text.trim();
                        if (firstName.isNotEmpty && lastName.isNotEmpty) {
                          userController.updateUserInfo(firstName, lastName);
                        } else {
                          Get.snackbar('Error', 'Please enter all fields');
                        }
                      },
                      child: Text('Update'),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
