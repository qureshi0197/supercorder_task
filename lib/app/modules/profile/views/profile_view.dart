import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../services/permission_service.dart';
import '../controllers/profile_controller.dart';
import '../../../routes/app_routes.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  void _toggleLanguage() {
    Locale current = Get.locale ?? const Locale('ko', 'KR');
    if (current.languageCode == 'ko') {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('ko', 'KR'));
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final permissionService = Get.find<PermissionService>();
    bool granted = false;

    if (source == ImageSource.gallery) {
      granted = await permissionService.requestStorage();
    } else {
      granted = await Permission.camera.request().isGranted;
    }

    if (!granted) return;

    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: source);
    if (file != null) {
      controller.profileImagePath.value = file.path;
    }
  }

  void _showPicker() {
    Get.bottomSheet(
      SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text('camera'.tr),
              onTap: () {
                Get.back();
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: Text('gallery'.tr),
              onTap: () {
                Get.back();
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('hello'.tr),
        actions: [IconButton(onPressed: _toggleLanguage, icon: const Icon(Icons.language), tooltip: 'Change language')],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Greeting + avatar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // const SizedBox(width: 12),
                Expanded(child: Text('${'hello'.tr},\nAbdullah Qureshi', style: Theme.of(context).textTheme.bodyLarge)),
                GestureDetector(
                  onTap: _showPicker,
                  child: Container(
                    width: 92,
                    height: 92,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE5E5E5), // light grey background
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_5_camera.svg',
                          width: 23,
                          height: 16,
                          colorFilter: const ColorFilter.mode(Color(0xFF888888), BlendMode.srcIn),
                        ),
                        const SizedBox(height: 6),
                        Text('upload_image'.tr, style: const TextStyle(fontSize: 12, color: Color(0xFF888888))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Campaign summary card
          GestureDetector(
            onTap: () => Get.toNamed(Routes.campaigns),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCampaignItem('application'.tr, '0'),
                  Icon(Icons.arrow_forward_ios_rounded, size: 14),
                  _buildCampaignItem('in_progress'.tr, '0'),
                  Icon(Icons.arrow_forward_ios_rounded, size: 14),
                  _buildCampaignItem('completed'.tr, '0'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Menu List
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem('my_info'.tr, Routes.info),
                _buildMenuItem('공지사항', null),
                _buildMenuItem('1:1문의', null),
                _buildMenuItem('FAQ', null),
                _buildMenuItem('약관 및 정책', null),
                _buildMenuItem('로그아웃', null),
                _buildMenuItem('회원탈퇴', null),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampaignItem(String label, String count) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildMenuItem(String title, String? route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
        ),
        child: ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(title),
          onTap: route != null ? () => Get.toNamed(route) : null,
          trailing: const Icon(Icons.chevron_right),
          visualDensity: const VisualDensity(horizontal: -4),
        ),
      ),
    );
  }
}
