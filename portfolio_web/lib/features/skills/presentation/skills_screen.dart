import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../../shared/widgets/hover_scale_card.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FadeInAnimation(
              delay: const Duration(milliseconds: 100),
              child: Text(
                "MY SKILLS",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: const Color(0xFFE0F780), // Lime accent from image
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 60),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _buildSkillsGrid()),
                      const SizedBox(width: 40),
                      Expanded(flex: 2, child: _buildExperienceCard()),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildSkillsGrid(),
                      const SizedBox(height: 40),
                      _buildExperienceCard(),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsGrid() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: Constants.skillItems.asMap().entries.map((entry) {
        return FadeInAnimation(
          delay: Duration(milliseconds: 200 + (entry.key * 50)),
          child: HoverScaleCard(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF112240), // Dark card
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    entry.value['icon'] as IconData,
                    color: _getIconColor(entry.value['name']),
                    size: 30,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    entry.value['name'],
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
          ),
        );
      }).toList(),
    );
  }

  Widget _buildExperienceCard() {
    return Container(
      height: 340, // Match grid height roughly
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // Slightly darker/different card bg
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "7+",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Months\nExperience\nWorking",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Download logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0F780), // Lime accent
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "DOWNLOAD MY CV",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Color _getIconColor(String name) {
    // Optional: Return specific colors for icons if desired, else default cyan/white
    switch (name) {
      case 'Flutter':
        return Colors.blue;
      case 'Dart':
        return Colors.blueAccent;
      case 'Android':
        return Colors.green;
      case 'HTML / CSS':
        return Colors.orange;
      case 'Firebase':
        return Colors.amber;
      case 'MongoDB':
        return Colors.green;
      case 'Go':
        return Colors.lightBlue;
      case 'Figma':
        return Colors.purpleAccent;
      case 'C / C++':
        return Colors.blueGrey;
      case 'Git':
        return Colors.white;
      case 'Postman':
        return Colors.orangeAccent;
      default:
        return AppTheme.primaryColor;
    }
  }
}
