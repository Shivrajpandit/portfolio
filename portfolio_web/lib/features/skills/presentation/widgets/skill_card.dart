import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import '../../../../shared/widgets/hover_scale_card.dart';

class SkillCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color iconColor;

  const SkillCard({
    super.key,
    required this.name,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScaleCard(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFF112240),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
