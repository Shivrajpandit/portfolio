import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';

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
                  child: _ExperienceTimelineItem(
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

class _ExperienceTimelineItem extends StatelessWidget {
  final Map<String, dynamic> experience;
  final bool isLast;

  const _ExperienceTimelineItem({
    required this.experience,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Vertical Timeline Line
        if (!isLast)
          Positioned(
            left: 7, // Centered under the 16px dot
            top: 20, // Start below the dot
            bottom: 0, // Extend to the bottom of the item
            child: Container(
              width: 2,
              color: AppTheme.primaryColor.withOpacity(0.5),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0), // Spacing between items
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline Dot
              Container(
                margin: const EdgeInsets.only(
                  top: 2,
                ), // Align with first line of text
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              // Content Card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF112240), // Card color
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header: Role and Period
                      LayoutBuilder(
                        builder: (context, constraints) {
                          bool isNarrow = constraints.maxWidth < 450;
                          return isNarrow
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      experience['role'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildPeriodBadge(experience['period']),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        experience['role'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    _buildPeriodBadge(experience['period']),
                                  ],
                                );
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        experience['company'],
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        experience['description'],
                        style: const TextStyle(
                          color: AppTheme.subTextColor,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodBadge(String period) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.5)),
      ),
      child: Text(
        period,
        style: const TextStyle(
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
