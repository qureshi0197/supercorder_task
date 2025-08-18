import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService extends GetxService {
  // Gallery / photo access
  Future<bool> requestStorage() async {
    if (Platform.isIOS) {
      final status = await Permission.photos.request();
      if (!status.isGranted) {
        Get.snackbar('Permission', 'photo_permission_required'.tr);
        return false;
      }
      return true;
    }

    // Android
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      Get.snackbar('Permission', 'storage_permission_required'.tr);
      return false;
    }
    return true;
  }

  // Camera access
  Future<bool> requestCamera() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      Get.snackbar('Permission', 'camera_permission_required'.tr);
      return false;
    }
    return true;
  }
}
