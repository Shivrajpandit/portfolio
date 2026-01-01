import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import '../../../../utils/constants.dart';

class AnimatedNameText extends StatelessWidget {
  final CrossAxisAlignment textAlign;

  const AnimatedNameText({super.key, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFF64FFDA), // Bright Teal
          Color(0xFF00BFA5), // Darker Teal
          Colors.purpleAccent,
          Colors.deepPurple,
        ],
        stops: [0.0, 0.3, 0.7, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        Constants.name.toUpperCase(),
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 90,
          color: Colors.white,
          fontWeight: FontWeight.w900,
          height: 0.9,
          letterSpacing: -2.0,
        ),
        textAlign: textAlign == CrossAxisAlignment.center
            ? TextAlign.center
            : TextAlign.start,
      ),
    );
  }
}
