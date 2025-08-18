import 'package:get/get.dart';

import '../app/services/permission_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PermissionService());
  }
}
