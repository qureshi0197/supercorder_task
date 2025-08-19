import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final currentCtrl = TextEditingController();
  final newCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();
  final isValid = false.obs;


  void validateAndSubmit() {
    if (newCtrl.text != confirmCtrl.text) {
      Get.snackbar('Error', 'password_not_match'.tr);
      return;
    }
    Get.snackbar('Success', 'password_updated'.tr);
  }

  @override
  void onClose() {
    currentCtrl.dispose();
    newCtrl.dispose();
    confirmCtrl.dispose();
    super.onClose();
  }
}
