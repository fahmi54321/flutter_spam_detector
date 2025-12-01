// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SpamPredicted extends StatelessWidget {
  final String? prediction;
  final double? probability;
  const SpamPredicted({super.key, this.prediction, this.probability});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            children: [
              Icon(
                prediction == "spam"
                    ? Icons.warning_amber_rounded
                    : Icons.check_circle,
                color: prediction == "spam"
                    ? Colors.redAccent
                    : Colors.greenAccent,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Prediction: $prediction",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        if (probability != null)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: Text(
              "Spam Probability: $probability %",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
