import 'package:dokan/product_page.dart';
import 'package:dokan/update_user_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var userId = ''.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var token = ''.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    final url = 'https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      token.value = data['token'];
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token.value);
      userId.value = decodedToken['data']['user']['id'].toString();

      // Fetch user info
      await fetchUserInfo(userId.value);

      print("User ID: ${userId.value}");
      print("First Name: ${firstName.value}");
      print("Last Name: ${lastName.value}");

      Get.to(() => ProductPage());
    } else {
      Get.snackbar('Error', 'Login failed');
    }
    isLoading.value = false;
  }

  Future<void> fetchUserInfo(String userId) async {
    isLoading.value = true;
    final url = 'https://apptest.dokandemo.com/wp-json/wp/v2/users/$userId';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${token.value}',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      firstName.value = data['first_name'] ?? '';
      lastName.value = data['last_name'] ?? '';
      this.userId.value = userId;
    } else {
      Get.snackbar('Error', 'Failed to fetch user data');
    }
    isLoading.value = false;
  }

  Future<void> updateUserInfo(String firstName, String lastName) async {
    isLoading.value = true;
    final url = 'https://apptest.dokandemo.com/wp-json/wp/v2/users/${userId.value}';
    print(url);
    print('url');
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token.value}',
      },
      body: json.encode({
        'first_name': firstName,
        'last_name': lastName,
      }),
    );
    print(response.body);
    print(response.statusCode);
    print('response');
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'User info updated');
      await fetchUserInfo(userId.value);  // Refresh user info
    } else {
      Get.snackbar('Error', 'Failed to update user info');
    }
    isLoading.value = false;
  }
}