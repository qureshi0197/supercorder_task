import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/permission_service.dart';
import '../controllers/basic_info_controller.dart';

class BasicInfoView extends GetView<BasicInfoController> {
  const BasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('basic_info'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '아이디', // ID
                  enabled: false,
                ),
              ),
              const SizedBox(height: 12),
              TextField(decoration: const InputDecoration(labelText: '이메일')),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(decoration: const InputDecoration(labelText: '휴대폰 번호')),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder (static)
                    },
                    child: const Text('변경'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const TextField(decoration: InputDecoration(labelText: '닉네임')),
              const SizedBox(height: 12),
              const TextField(decoration: InputDecoration(labelText: '인스타그램 아이디')),
              const SizedBox(height: 12),
              const TextField(decoration: InputDecoration(labelText: '대표 작업 링크')),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  final permissionService = Get.find<PermissionService>();
                  final granted = await permissionService.requestStorage();
                  if (granted) {
                    // pick file
                    final result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      final filePath = result.files.single.path;
                      if (filePath != null) {
                        Get.snackbar('File selected', filePath);
                      }
                    }
                  }
                },
                child: Text('upload_portfolio'.tr),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: null, // Disabled for now
                child: const Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
