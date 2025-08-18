import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/campaigns_controller.dart';

class CampaignsView extends GetView<CampaignsController> {
  const CampaignsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_campaigns'.tr),
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(text: 'application'.tr),
            Tab(text: 'in_progress'.tr),
            Tab(text: 'completed'.tr),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          Center(child: Text('Application List')),
          Center(child: Text('In Progress List')),
          Center(child: Text('Completed List')),
        ],
      ),
    );
  }
}
