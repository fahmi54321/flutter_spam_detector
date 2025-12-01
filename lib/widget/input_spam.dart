import 'package:flutter/material.dart';

class InputSpam extends StatelessWidget {
  final TextEditingController controller;
  const InputSpam({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.2),
        hintText: 'Enter an SMS text here…',
        hintStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      maxLines: null,
    );
  }
}
