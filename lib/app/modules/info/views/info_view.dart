import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_page_header.dart';
import '../controllers/info_controller.dart';
import '../../../routes/app_routes.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const CustomPageHeader(title: 'my_info'),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
              ),
              child: ListTile(
                title: Text('basic_info'.tr),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Get.toNamed(Routes.basicInfo),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
              ),
              child: ListTile(
                title: Text('set_password'.tr),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Get.toNamed(Routes.password),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
              ),
              child: const ListTile(
                title: Text('관심 카테고리'), // Interest Category (placeholder)
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
