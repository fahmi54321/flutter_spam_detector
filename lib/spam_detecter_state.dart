import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpamDetecterState extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  bool isLoading = false;
  bool isButtonPressed = false;

  String? prediction;
  double? probability;

  void updateIsButtonPressed(bool value) {
    isButtonPressed = value;
    notifyListeners();
  }

  void updateIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void updatePrediction(String? value) {
    prediction = value;
    notifyListeners();
  }

  void updateProbability(double? value) {
    probability = value;
    notifyListeners();
  }

  Future<void> analyzeText(String inputText) async {
    updateIsloading(true);
    updatePrediction(null);
    updateProbability(null);

    final uri = Uri.parse('http://10.0.2.2:5000/predict');

    try {
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"text": inputText}),
      );

      await Future.delayed(const Duration(seconds: 1));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        updatePrediction(data["prediction"]);
        updateProbability(data["spam_probability_format"]?.toDouble());
      } else {
        updatePrediction("Error");
        updateProbability(null);
      }
    } catch (e) {
      updatePrediction("Failed to connect server");
      updateProbability(null);
    } finally {
      updateIsloading(false);
    }
  }
}
