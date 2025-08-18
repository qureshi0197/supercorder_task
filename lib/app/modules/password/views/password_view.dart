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
            TextField(obscureText: true, decoration: const InputDecoration(labelText: '기본 비밀번호')),
            const SizedBox(height: 12),
            TextField(obscureText: true, decoration: const InputDecoration(labelText: '새 비밀번호')),
            const SizedBox(height: 12),
            TextField(obscureText: true, decoration: const InputDecoration(labelText: '비밀번호 확인')),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // TODO: validate and save
              },
              child: const Text('완료'),
            ),
          ],
        ),
      ),
    );
  }
}
