import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_page_header.dart';
import '../../../widgets/custom_text_field.dart';
import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const CustomPageHeader(title: 'set_password'),
            CustomTextField(
              label: 'current_password',
              placeholder: 'password_placeholder',
              controller: controller.currentCtrl,
              required: true,
            ),
            const SizedBox(height: 12),
            CustomTextField(label: 'new_password', placeholder: 'password_placeholder', controller: controller.newCtrl, required: true),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'confirm_password',
              placeholder: 'confirm_placeholder',
              controller: controller.confirmCtrl,
              required: true,
            ),
            const Spacer(),
            Obx(
              () => CustomButton(
                text: 'complete',
                onPressed: controller.isValid.value ? () => controller.validateAndSubmit() : null,
                height: 48,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
