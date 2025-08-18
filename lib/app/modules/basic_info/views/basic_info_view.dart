import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_task/app/widgets/custom_page_header.dart';
import '../../../services/permission_service.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../controllers/basic_info_controller.dart';

class BasicInfoView extends GetView<BasicInfoController> {
  const BasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('basic_info'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              const CustomPageHeader(title: 'basic_info'),
              // ID (disabled)
              CustomTextField(label: 'id', placeholder: 'id_placeholder', controller: controller.idCtrl),
              const SizedBox(height: 12),

              // Email
              CustomTextField(label: 'email', placeholder: 'email_placeholder', controller: controller.emailCtrl),
              const SizedBox(height: 12),

              // Phone + Change button in Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(label: 'phone', placeholder: 'phone_placeholder', controller: controller.phoneCtrl),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      SizedBox(height: 25),
                      CustomButton(text: 'change', onPressed: () {}, height: 50),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Nickname
              CustomTextField(label: 'nickname', placeholder: 'nickname_placeholder', controller: controller.nickCtrl),
              const SizedBox(height: 12),

              // Insta
              CustomTextField(label: 'instagram_id', placeholder: 'instagram_placeholder', controller: controller.instagramCtrl),
              const SizedBox(height: 12),

              // Portfolio Link
              CustomTextField(
                label: 'work_link',
                placeholder: 'work_link_placeholder',
                controller: controller.workLinkCtrl,
                trailing: IconButton(
                  icon: const Icon(Icons.attach_file),
                  color: Colors.grey,
                  onPressed: () async {
                    final permissionService = Get.find<PermissionService>();
                    if (await permissionService.requestStorage()) {
                      final result = await FilePicker.platform.pickFiles();
                      if (result != null && result.files.single.path != null) {
                        Get.snackbar('file_selected'.tr, result.files.single.path!);
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFcecece),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
                onPressed: null,
                child: Text('save'.tr, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
