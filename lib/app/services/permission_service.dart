import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService extends GetxService {
  Future<bool> requestStorage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) return true;

    Get.snackbar('Permission', 'Storage permission is required');
    return false;
  }
}
