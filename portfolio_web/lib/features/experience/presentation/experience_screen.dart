import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';
import 'widgets/experience_timeline_item.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInAnimation(
              delay: const Duration(milliseconds: 100),
              child: Text(
                "Experience",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 60),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constants.experiences.length,
              itemBuilder: (context, index) {
                return FadeInAnimation(
                  delay: Duration(milliseconds: 200 + (index * 150)),
                  slideOffset: const Offset(0.2, 0),
                  child: ExperienceTimelineItem(
                    experience: Constants.experiences[index],
                    isLast: index == Constants.experiences.length - 1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
