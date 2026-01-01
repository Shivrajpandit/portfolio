import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';
import 'widgets/skill_card.dart';
import 'widgets/experience_card.dart';
import 'utils/skills_helper.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  void _handleDownloadCV() {
    // TODO: Implement CV download logic
    debugPrint('Download CV clicked');
  }

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
                  color: const Color(0xFFE0F780),
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
                      Expanded(
                        flex: 2,
                        child: ExperienceCard(onDownloadCV: _handleDownloadCV),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildSkillsGrid(),
                      const SizedBox(height: 40),
                      ExperienceCard(onDownloadCV: _handleDownloadCV),
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
          child: SkillCard(
            name: entry.value['name'],
            icon: entry.value['icon'] as IconData,
            iconColor: SkillsHelper.getIconColor(entry.value['name']),
          ),
        );
      }).toList(),
    );
  }
}
