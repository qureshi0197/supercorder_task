import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignsController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    // initialIndex = 0 for "application"
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class CampaignModel {
  final String title;
  Rx<File?> imageFile;

  CampaignModel({required this.title, File? initialFile}) : imageFile = Rx<File?>(initialFile);
}

