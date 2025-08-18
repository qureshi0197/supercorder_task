import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInfoController extends GetxController {

  final idCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final nickCtrl = TextEditingController();
  final instagramCtrl = TextEditingController();
  final workLinkCtrl = TextEditingController();
  
  @override
  void onReady() {
    super.onReady();
    print('BasicInfoController onReady called');
  }

  @override
  void onClose() {
    idCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    nickCtrl.dispose();
    instagramCtrl.dispose();
    workLinkCtrl.dispose();
    super.onClose();
  }
}
