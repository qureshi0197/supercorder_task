import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/basic_info_controller.dart';

class BasicInfoView extends GetView<BasicInfoController> {
  const BasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('basic_info'.tr)),
      body: Center(child: Text('basic_info'.tr)),
    );
  }
}
