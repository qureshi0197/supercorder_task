import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    print('here');
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.profile);
    });
  }
}
