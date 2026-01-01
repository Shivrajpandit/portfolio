import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class AboutSectionHeader extends StatelessWidget {
  const AboutSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppTheme.primaryColor, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: RichText(
            text: TextSpan(
              text: "About ",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "Me",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(width: 60, height: 4, color: AppTheme.primaryColor),
      ],
    );
  }
}
