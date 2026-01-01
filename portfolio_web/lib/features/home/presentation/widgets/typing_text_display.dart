import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

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
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
        fontSize: 26,
        color: AppTheme.textColor.withOpacity(0.9),
        fontWeight: FontWeight.w400,
        letterSpacing: 1.0,
      ),
      textAlign: textAlign == CrossAxisAlignment.center
          ? TextAlign.center
          : TextAlign.start,
    );
  }
}
