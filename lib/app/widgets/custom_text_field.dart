import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? placeholder;
  final bool required;
  final TextEditingController? controller;
  final Widget? trailing;

  const CustomTextField({super.key, required this.label, this.placeholder, this.required = false, this.controller, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---- LABEL ----
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
            children: [
              TextSpan(text: label.tr),
              if (required)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),

        // ---- TEXT FIELD ----
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder?.tr,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffD7D7D7)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffD7D7D7)),
            ),
            suffixIcon: trailing,
          ),
        ),
      ],
    );
  }
}
