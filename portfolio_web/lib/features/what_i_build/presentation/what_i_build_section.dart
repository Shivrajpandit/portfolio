import 'package:flutter/material.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/fade_in_animation.dart';

class WhatIBuildSection extends StatelessWidget {
  const WhatIBuildSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 60 : (width > 600 ? 32 : 20),
        vertical: 80,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Column(
          children: [
            const FadeInAnimation(
              delay: Duration(milliseconds: 100),
              child: SectionHeader(
                badgeText: "Engineering Capabilities",
                badgeIcon: Icons.layers_rounded,
                title: "What I Build",
                subtitle:
                    "From conceptualizing machine learning pipelines to shipping native mobile apps and high-throughput backend APIs.",
              ),
            ),
            const SizedBox(height: 50),

            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth >= 950
                    ? 3
                    : (constraints.maxWidth >= 600 ? 2 : 1);
                final childAspectRatio = crossAxisCount == 1
                    ? (constraints.maxWidth < 420 ? 1.32 : 1.55)
                    : (crossAxisCount == 2 ? 1.2 : 1.15);

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: PortfolioData.whatIBuild.length,
                  itemBuilder: (context, index) {
                    final item = PortfolioData.whatIBuild[index];
                    final color = item['color'] as Color;
                    final icon = item['icon'] as IconData;

                    return FadeInAnimation(
                      delay: Duration(milliseconds: 150 + (index * 80)),
                      child: HoverLiftCard(
                        liftAmount: -6,
                        child: Container(
                          padding: EdgeInsets.all(constraints.maxWidth < 450 ? 20 : 26),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF0C1322).withValues(alpha: 0.85)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: color.withValues(alpha: isDark ? 0.3 : 0.2),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: color.withValues(alpha: isDark ? 0.08 : 0.04),
                                blurRadius: 24,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: color.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: color.withValues(alpha: 0.3),
                                  ),
                                ),
                                child: Icon(icon, color: color, size: 24),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'] as String,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                      color: isDark
                                          ? Colors.white
                                          : const Color(0xFF0F172A),
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item['description'] as String,
                                    style: TextStyle(
                                      fontSize: 13,
                                      height: 1.6,
                                      color: isDark
                                          ? const Color(0xFF94A3B8)
                                          : const Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
