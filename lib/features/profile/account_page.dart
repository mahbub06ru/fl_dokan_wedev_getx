import 'package:dokan/utils/text_black.dart';
import 'package:dokan/utils/text_grey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_constants.dart';
import '../../utils/image_constants.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150', // Replace with actual image URL
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // User Name
            Text(
              'John Smith',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Urbanist', // Use your app's font here
                fontWeight: FontWeight.bold,
              ),
            ),
            // User Email
            Text(
              'info@johnsmith.com',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontFamily: 'Urbanist', // Use your app's font here
              ),
            ),
            const SizedBox(height: 20.0),
            // Card with Expandable Items
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: const [
                  ExpandableItem(title: 'Account', image: 'assets/account_icon.svg'), // Replace with actual image path
                  ExpandableItem(title: 'Password', image: 'assets/password_icon.svg'), // Replace with actual image path
                  ExpandableItem(title: 'Notifications', image: 'assets/notifications_icon.svg'), // Replace with actual image path
                  ExpandableItem(title: 'Wishlist', image: 'assets/wishlist_icon.svg'), // Replace with actual image path
                ],
              ),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}

class ExpandableItem extends StatelessWidget {
  final String title;
  final String image;

  const ExpandableItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Details about $title'),
        ),
      ],
    );
  }
}