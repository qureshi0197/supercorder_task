import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('my_info'.tr)),
      body: Center(child: Text('my_info'.tr)),
    );
  }
}
