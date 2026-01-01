import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class AnimatedNameText extends StatelessWidget {
  final CrossAxisAlignment textAlign;

  const AnimatedNameText({super.key, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          AppTheme.primaryColor,
          AppTheme.accentColor,
          AppTheme.purpleAccent,
          AppTheme.pinkAccent,
        ],
        stops: [0.0, 0.3, 0.7, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        "SHIVRAJ\nPANDIT",
        style: Theme.of(
          context,
        ).textTheme.displayLarge?.copyWith(height: 0.9, fontSize: 100),
        textAlign: textAlign == CrossAxisAlignment.center
            ? TextAlign.center
            : TextAlign.start,
      ),
    );
  }
}
