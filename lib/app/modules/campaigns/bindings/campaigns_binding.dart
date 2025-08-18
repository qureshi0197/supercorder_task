import 'package:get/get.dart';

import '../controllers/campaigns_controller.dart';

class CampaignsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CampaignsController());
  }
}
