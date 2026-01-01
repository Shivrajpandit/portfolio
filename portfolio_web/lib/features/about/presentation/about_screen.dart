import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';
import 'widgets/about_section_header.dart';
import 'widgets/about_info_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Header
            const FadeInAnimation(
              delay: Duration(milliseconds: 100),
              child: AboutSectionHeader(),
            ),
            const SizedBox(height: 50),

            // Description
            FadeInAnimation(
              delay: const Duration(milliseconds: 300),
              child: Text(
                Constants.aboutMe,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            const SizedBox(height: 60),

            // Info Cards
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 700) {
                  return const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AboutInfoCard(
                          title: "Experience",
                          icon: Icons.business_center_outlined,
                          items: Constants.aboutExperience,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: AboutInfoCard(
                          title: "Education",
                          icon: Icons.school_outlined,
                          items: Constants.education,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Column(
                    children: [
                      AboutInfoCard(
                        title: "Experience",
                        icon: Icons.business_center_outlined,
                        items: Constants.aboutExperience,
                      ),
                      SizedBox(height: 30),
                      AboutInfoCard(
                        title: "Education",
                        icon: Icons.school_outlined,
                        items: Constants.education,
                      ),
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
}
