import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';

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
            FadeInAnimation(
              delay: const Duration(milliseconds: 100),
              child: ShaderMask(
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
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(
                              color: Colors.white, // Gradient applies to this
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            FadeInAnimation(
              delay: const Duration(milliseconds: 200),
              child: Container(
                width: 60,
                height: 4,
                color: AppTheme.primaryColor,
              ),
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
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          context,
                          "Experience",
                          Icons.business_center_outlined,
                          Constants.aboutExperience,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: _buildInfoCard(
                          context,
                          "Education",
                          Icons.school_outlined,
                          Constants.education,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildInfoCard(
                        context,
                        "Experience",
                        Icons.business_center_outlined,
                        Constants.aboutExperience,
                      ),
                      const SizedBox(height: 30),
                      _buildInfoCard(
                        context,
                        "Education",
                        Icons.school_outlined,
                        Constants.education,
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

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    IconData icon,
    List<String> items,
  ) {
    return Container(
      padding: const EdgeInsets.all(30),
      // Glassmorphism Card
      decoration: BoxDecoration(
        color: const Color(0xFF112240).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryColor.withOpacity(0.2),
                      Colors.purpleAccent.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                  ),
                ),
                child: Icon(icon, color: AppTheme.primaryColor, size: 26),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Icon(Icons.circle, size: 6, color: Colors.white70),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
