import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('set_password'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.currentCtrl,
              obscureText: true,
              decoration: InputDecoration(labelText: 'current_password'.tr),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.newCtrl,
              obscureText: true,
              decoration: InputDecoration(labelText: 'new_password'.tr),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.confirmCtrl,
              obscureText: true,
              decoration: InputDecoration(labelText: 'confirm_password'.tr),
            ),
            const Spacer(),
            ElevatedButton(onPressed: () => controller.validateAndSubmit(), child: Text('complete'.tr)),
          ],
        ),
      ),
    );
  }
}
