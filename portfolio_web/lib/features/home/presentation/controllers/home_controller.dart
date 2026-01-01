import 'dart:async';
import 'package:flutter/material.dart';

class HomeController {
  final String targetText = "Flutter Developer | Software Engineer";
  late String displayText;

  HomeController() {
    displayText = targetText;
  }

  void initializeAnimations(TickerProvider vsync) {
    // Animations removed
  }

  Future<void> startTyping(
    VoidCallback onUpdate,
    bool Function() isMounted,
  ) async {
    // Typing animation removed
  }

  void dispose() {
    // No animations to dispose
  }
}
