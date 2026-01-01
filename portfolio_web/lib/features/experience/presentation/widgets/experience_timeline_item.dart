import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class ExperienceTimelineItem extends StatelessWidget {
  final Map<String, dynamic> experience;
  final bool isLast;

  const ExperienceTimelineItem({
    super.key,
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
            left: 7,
            top: 20,
            bottom: 0,
            child: Container(
              width: 2,
              color: AppTheme.primaryColor.withOpacity(0.5),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline Dot
              Container(
                margin: const EdgeInsets.only(top: 2),
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
                    color: const Color(0xFF112240),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
