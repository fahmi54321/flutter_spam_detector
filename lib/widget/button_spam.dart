// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonSpam extends StatelessWidget {
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCancelCallback? onTapCancel;
  final GestureTapCallback? onTap;
  final bool isButtonPressed;
  const ButtonSpam({
    super.key,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onTap,
    required this.isButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isButtonPressed
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.white.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (!isButtonPressed)
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: const Text(
          'Analyze Text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
