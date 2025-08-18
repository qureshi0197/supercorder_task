import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/campaigns_controller.dart';

class CampaignsView extends GetView<CampaignsController> {
  const CampaignsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('my_campaigns'.tr)),
      body: Center(child: Text('application'.tr)),
    );
  }
}
