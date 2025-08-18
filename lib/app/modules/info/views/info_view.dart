import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/info_controller.dart';
import '../../../routes/app_routes.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('my_info'.tr)),
      body: ListView(
        children: [
          ListTile(title: Text('basic_info'.tr), trailing: const Icon(Icons.chevron_right), onTap: () => Get.toNamed(Routes.basicInfo)),
          ListTile(title: Text('set_password'.tr), trailing: const Icon(Icons.chevron_right), onTap: () => Get.toNamed(Routes.password)),
          const ListTile(
            title: Text('관심 카테고리'), // Interest Category (placeholder)
            trailing: Icon(Icons.chevron_right),
            // onTap: null  (placeholder - no navigation yet)
          ),
        ],
      ),
    );
  }
}
