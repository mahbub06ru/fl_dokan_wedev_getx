import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/custom_appbar.dart';
import '../widgets/product_item.dart';


class ProductPage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title:  'Product List',
        onTap: () {  },
        buildActions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showFilterBottomSheet(context);
            },
          ),
        ],
      ),

      body: Obx(() => controller.isLoading.value
          ? buildShimmerGrid()
          : buildProductGrid()),
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              CheckboxListTile(
                title: const Text('Newest'),
                value: controller.filter.value == 'newest',
                onChanged: (bool? value) {
                  if (value != null && value) {
                    controller.applyFilter('newest');
                  }
                },
              ),
              CheckboxListTile(
                title: const Text('Oldest'),
                value: controller.filter.value == 'oldest',
                onChanged: (bool? value) {
                  if (value != null && value) {
                    controller.applyFilter('oldest');
                  }
                },
              ),
              CheckboxListTile(
                title: const Text('Best Sell'),
                value: controller.filter.value == 'best_sell',
                onChanged: (bool? value) {
                  if (value != null && value) {
                    controller.applyFilter('best_sell');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 8,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: 6,
      itemBuilder: (ctx, i) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 120.0,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 20.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 80.0,
                    height: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(5.0.w),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 8,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: controller.products.length,
      itemBuilder: (ctx, i) => ProductItem(
        name: controller.products[i]['name'],
        price: controller.products[i]['price'],
        regPrice: controller.products[i]['regular_price'],
        rating: double.parse(controller.products[i]['average_rating'] ?? '0'),
        imageUrl: controller.products[i]['images'][0]['src'],
      ),
    );
  }
}


