import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/campaigns_controller.dart';

class CampaignsView extends GetView<CampaignsController> {
  const CampaignsView({super.key});

  Widget _buildCampaignCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 70,
              height: 70,
              color: Colors.amber,
            ), //Image.asset('assets/images/dummy_image.png', width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('campaign_title'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  'campaign_subtitle'.tr,
                  style: const TextStyle(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    _CategoryChip(label: 'tag_fnb'),
                    SizedBox(width: 4),
                    _CategoryChip(label: 'tag_fashion'),
                    SizedBox(width: 4),
                    _CategoryChip(label: 'tag_kids'),
                    SizedBox(width: 4),
                    _CategoryChip(label: 'tag_living'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('campaign_matching'.tr),
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
        children: [
          ListView(children: List.generate(15, (index) => _buildCampaignCard('assets/images/dummy_image.png'))),
          Center(child: Text('in_progress'.tr)),
          Center(child: Text('completed'.tr)),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  const _CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: const Color(0xFFEAE4FF), borderRadius: BorderRadius.circular(6)),
      child: Text(label.tr, style: const TextStyle(fontSize: 10, color: Color(0xFF7A32F5))),
    );
  }
}
