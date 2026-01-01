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
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      decoration: BoxDecoration(
        color: const Color(0xFF112240).withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: textAlign,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const GreetingBadge(),
          const SizedBox(height: 10),
          AnimatedNameText(textAlign: textAlign),
          const SizedBox(height: 20),
          TypingTextDisplay(displayText: displayText, textAlign: textAlign),
          const SizedBox(height: 40),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 30,
            runSpacing: 20,
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
    );
  }
}
