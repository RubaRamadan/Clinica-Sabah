import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CommonWidgets {
  static void snackBar(String type, String message) async {
    Get.snackbar(
        type,
        message,
        // maxWidth: 500,
        snackPosition: SnackPosition.TOP,
        backgroundColor: type == 'error'.tr ? Colors.red : Colors.green,
        colorText:Colors.white, //type == 'error' ?Colors.white : TypographyColor.titleTable,
        icon: Icon(type == 'error'.tr ?Icons.error:Icons.check_circle, color: Colors.white),
    );
  }

  static void showSuccessToast(String title, String message) async {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }
}
