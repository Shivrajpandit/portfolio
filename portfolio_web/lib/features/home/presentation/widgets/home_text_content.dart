import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import 'greeting_badge.dart';
import 'animated_name_text.dart';
import 'typing_text_display.dart';
import 'contact_button.dart';
import 'social_icons_row.dart';

class HomeTextContent extends StatelessWidget {
  final String displayText;
  final CrossAxisAlignment textAlign;
  final VoidCallback onContactPressed;

  const HomeTextContent({
    super.key,
    required this.displayText,
    required this.textAlign,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      decoration: BoxDecoration(
        color: const Color(0xFF112240).withOpacity(0.3),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          width: 1.5,
          color: AppTheme.primaryColor.withOpacity(0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.05),
            blurRadius: 60,
            spreadRadius: -10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            crossAxisAlignment: textAlign,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const GreetingBadge(),
              const SizedBox(height: 15),
              AnimatedNameText(textAlign: textAlign),
              const SizedBox(height: 25),
              TypingTextDisplay(displayText: displayText, textAlign: textAlign),
              const SizedBox(height: 45),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 30,
                runSpacing: 25,
                alignment: textAlign == CrossAxisAlignment.center
                    ? WrapAlignment.center
                    : WrapAlignment.start,
                children: [
                  ContactButton(onPressed: onContactPressed),
                  const SocialIconsRow(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
