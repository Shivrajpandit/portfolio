import 'dart:async';
import 'package:flutter/material.dart';

class HomeController {
  String displayText = "";
  final String targetText = "Flutter Developer | Software Engineer";
  int textIndex = 0;

  AnimationController? floatController;
  Animation<double>? floatAnimation;

  void initializeAnimations(TickerProvider vsync) {
    floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: vsync,
    )..repeat(reverse: true);

    floatAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: floatController!, curve: Curves.easeInOut),
    );
  }

  Future<void> startTyping(
    VoidCallback onUpdate,
    bool Function() isMounted,
  ) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (!isMounted()) return;

    await Future.doWhile(() async {
      if (!isMounted()) return false;
      await Future.delayed(const Duration(milliseconds: 100));
      if (!isMounted()) return false;

      if (textIndex < targetText.length) {
        displayText += targetText[textIndex];
        textIndex++;
        onUpdate();
      }
      return textIndex < targetText.length;
    });
  }

  void dispose() {
    floatController?.dispose();
  }
}
