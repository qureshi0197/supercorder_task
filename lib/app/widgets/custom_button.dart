import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text; // translation key
  final VoidCallback? onPressed;
  final double? height;
  final double? width;

  const CustomButton({super.key, required this.text, required this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF430D7D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.2),
        ),
        onPressed: onPressed,
        child: Text(text.tr, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
