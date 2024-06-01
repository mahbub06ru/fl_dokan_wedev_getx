import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var products = [].obs;
  var filter = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/response.json');
    final data = json.decode(response);
    products.value = data;
    isLoading.value = false;
  }

  void applyFilter(String filterType) {
    filter.value = filterType;
    switch (filterType) {
      case 'newest':
        products.sort((a, b) => DateTime.parse(b['date_created']).compareTo(DateTime.parse(a['date_created'])));
        break;
      case 'oldest':
        products.sort((a, b) => DateTime.parse(a['date_created']).compareTo(DateTime.parse(b['date_created'])));
        break;
      case 'best_sell':
        products.sort((a, b) {
          var totalSalesA = a['total_sales'];
          var totalSalesB = b['total_sales'];

          if (totalSalesA is String) {
            totalSalesA = int.tryParse(totalSalesA) ?? 0;
          }
          if (totalSalesB is String) {
            totalSalesB = int.tryParse(totalSalesB) ?? 0;
          }

          return totalSalesB.compareTo(totalSalesA);
        });
        break;
    }
    Get.back(); // Close the bottom sheet
  }
}
