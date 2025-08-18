import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    
    void _toggleLanguage() {
      Locale current = Get.locale ?? const Locale('ko', 'KR');
      if (current.languageCode == 'ko') {
        Get.updateLocale(const Locale('en', 'US'));
      } else {
        Get.updateLocale(const Locale('ko', 'KR'));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
        actions: [IconButton(onPressed: _toggleLanguage, icon: const Icon(Icons.language), tooltip: 'Change language')],
      ),
      body: Center(child: Text('my_campaigns'.tr)),
    );
  }
}
