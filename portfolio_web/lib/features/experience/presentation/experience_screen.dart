import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/theme.dart';
import '../../../models/journey_model.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/fade_in_animation.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
          children: [
            const FadeInAnimation(
              delay: Duration(milliseconds: 100),
              child: SectionHeader(
                badgeText: "Career & Academic Roadmap",
                badgeIcon: Icons.timeline_rounded,
                title: "Engineering Journey",
                subtitle:
                    "A verified chronological progression through computer science foundations, industry mobile development, and specialized AI/Data Science engineering.",
              ),
            ),
            const SizedBox(height: 60),

            // Vertical Timeline
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PortfolioData.journey.length,
              itemBuilder: (context, index) {
                final item = PortfolioData.journey[index];
                final isLast = index == PortfolioData.journey.length - 1;

                return FadeInAnimation(
                  delay: Duration(milliseconds: 150 + (index * 80)),
                  slideOffset: const Offset(0.08, 0),
                  child: _buildTimelineItem(context, item, isLast, isDark, theme),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    JourneyModel item,
    bool isLast,
    bool isDark,
    ThemeData theme,
  ) {
    final width = MediaQuery.of(context).size.width;
    final nodeColWidth = width < 500 ? 34.0 : 46.0;
    final gapWidth = width < 500 ? 12.0 : 20.0;
    final nodeSize = width < 500 ? 30.0 : 38.0;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Left: Timeline Line with Glowing Node
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: nodeColWidth,
            child: Column(
              children: [
                // Node
                Container(
                  width: nodeSize,
                  height: nodeSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.accentColor.withValues(alpha: 0.15),
                    border: Border.all(
                      color: item.accentColor,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: item.accentColor.withValues(alpha: 0.4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: item.icon is IconData
                        ? Icon(item.icon, color: item.accentColor, size: width < 500 ? 15 : 18)
                        : FaIcon(item.icon as FaIconData, color: item.accentColor, size: width < 500 ? 15 : 18),
                  ),
                ),
                // Connector line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            item.accentColor.withValues(alpha: 0.6),
                            isDark
                                ? const Color(0x1AFFFFFF)
                                : const Color(0x1A000000),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Right: Content Card (natural height, zero overflow)
          Padding(
            padding: EdgeInsets.only(left: nodeColWidth + gapWidth),
            child: HoverLiftCard(
              liftAmount: -4,
              child: Container(
                padding: EdgeInsets.all(width < 500 ? 16 : 24),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0C1322).withValues(alpha: 0.85)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: item.accentColor.withValues(alpha: isDark ? 0.3 : 0.2),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: item.accentColor.withValues(alpha: isDark ? 0.06 : 0.03),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row: Year & Tag
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: item.accentColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.year,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: item.accentColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF131D36)
                                : const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.tag,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? const Color(0xFF94A3B8)
                                  : const Color(0xFF64748B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Title & Subtitle
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: item.accentColor,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      item.description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        height: 1.6,
                        color: isDark
                            ? const Color(0xFF94A3B8)
                            : const Color(0xFF475569),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Highlights
                    Column(
                      children: item.highlights.map((highlight) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_right_rounded,
                                size: 18,
                                color: item.accentColor,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  highlight,
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.5,
                                    color: isDark
                                        ? const Color(0xFFCBD5E1)
                                        : const Color(0xFF334155),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
