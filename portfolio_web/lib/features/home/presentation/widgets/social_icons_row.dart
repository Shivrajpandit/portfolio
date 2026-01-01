import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import '../../../../utils/constants.dart';

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: Constants.socialLinks.map((social) {
        return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0A192F),
              ),
              child: IconButton(
                onPressed: () {
                  // TODO: Navigate to social link
                },
                icon: Icon(social['icon'], size: 20, color: Colors.white70),
                hoverColor: AppTheme.primaryColor.withOpacity(0.1),
                splashRadius: 24,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
