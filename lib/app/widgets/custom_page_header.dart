import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageHeader extends StatelessWidget {
  final String title; // translation key
  final VoidCallback? onBack;

  const CustomPageHeader({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: onBack ?? () => Get.back()),
        const SizedBox(height: 4),
        Text(title.tr, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
      ],
    );
  }
}
