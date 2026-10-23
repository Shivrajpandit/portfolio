import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../utils/portfolio_data.dart';
import '../../../../shared/widgets/hover_lift_card.dart';

class QuickStatsBar extends StatelessWidget {
  const QuickStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 60 : (width > 600 ? 32 : 20),
        vertical: 20,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final isTablet = constraints.maxWidth >= 540 && !isWide;

            if (isWide) {
              return Row(
                children: PortfolioData.quickStats.map((stat) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: _buildStatCard(stat, isDark, theme),
                    ),
                  );
                }).toList(),
              );
            } else if (isTablet) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          PortfolioData.quickStats[0],
                          isDark,
                          theme,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildStatCard(
                          PortfolioData.quickStats[1],
                          isDark,
                          theme,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          PortfolioData.quickStats[2],
                          isDark,
                          theme,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildStatCard(
                          PortfolioData.quickStats[3],
                          isDark,
                          theme,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Column(
                children: PortfolioData.quickStats.map((stat) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildStatCard(stat, isDark, theme),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildStatCard(
    Map<String, dynamic> stat,
    bool isDark,
    ThemeData theme,
  ) {
    final color = stat['color'] as Color;
    final icon = stat['icon'];

    return HoverLiftCard(
      liftAmount: -4,
      scaleAmount: 1.01,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF0C1322).withValues(alpha: 0.8)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: color.withValues(alpha: isDark ? 0.25 : 0.2),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: isDark ? 0.08 : 0.04),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
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
              child: icon is IconData
                  ? Icon(icon, color: color, size: 22)
                  : FaIcon(icon as FaIconData, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    stat['value'] as String,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    stat['label'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
