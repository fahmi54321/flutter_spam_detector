import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spam_detection/spam_detecter_state.dart';
import 'package:flutter_spam_detection/widget/bg_gradient.dart';
import 'package:flutter_spam_detection/widget/button_spam.dart';
import 'package:flutter_spam_detection/widget/input_spam.dart';
import 'package:flutter_spam_detection/widget/loading_shimmer.dart';
import 'package:flutter_spam_detection/widget/spam_predicted.dart';
import 'package:flutter_spam_detection/widget/title_spam.dart';
import 'package:provider/provider.dart';

class SpamDetectorPage extends StatefulWidget {
  const SpamDetectorPage({super.key});

  @override
  State<SpamDetectorPage> createState() => _SpamDetectorPageState();
}

class _SpamDetectorPageState extends State<SpamDetectorPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SpamDetecterState(),
      child: Consumer(
        builder: (BuildContext context, SpamDetecterState state, _) {
          return Stack(
            children: [
              BgGradient(),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(color: Colors.white30),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // title
                              TitleSpam(),
                              const SizedBox(height: 16),

                              // input
                              InputSpam(controller: state.controller),

                              const SizedBox(height: 16),

                              // button
                              ButtonSpam(
                                isButtonPressed: state.isButtonPressed,
                                onTapDown: (_) =>
                                    state.updateIsButtonPressed(true),
                                onTapUp: (_) =>
                                    state.updateIsButtonPressed(false),
                                onTapCancel: () =>
                                    state.updateIsButtonPressed(false),
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  state.analyzeText(state.controller.text);
                                },
                              ),

                              const SizedBox(height: 24),

                              // result and loader
                              if (state.isLoading)
                                LoadingShimmer()
                              else if (state.prediction != null)
                                SpamPredicted(
                                  prediction: state.prediction,
                                  probability: state.probability,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
