import 'package:flutter/material.dart';

class TypingTextDisplay extends StatelessWidget {
  final String displayText;
  final CrossAxisAlignment textAlign;

  const TypingTextDisplay({
    super.key,
    required this.displayText,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: const Color(0xFFCCD6F6),
        fontWeight: FontWeight.w500,
        fontSize: 28,
        height: 1.2,
        letterSpacing: 1.2,
      ),
      textAlign: textAlign == CrossAxisAlignment.center
          ? TextAlign.center
          : TextAlign.start,
    );
  }
}
