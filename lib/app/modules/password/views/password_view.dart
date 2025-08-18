import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('set_password'.tr)),
      body: Center(child: Text('set_password'.tr)),
    );
  }
}
