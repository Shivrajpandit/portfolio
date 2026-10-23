import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/fade_in_animation.dart';
import 'widgets/about_profile_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 980;

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
            // Section Header
            const FadeInAnimation(
              delay: Duration(milliseconds: 100),
              child: SectionHeader(
                badgeText: "About Me",
                badgeIcon: Icons.person_rounded,
                title: "Engineering with purpose & intelligence.",
                subtitle:
                    "Bridging foundational Computer Science, Artificial Intelligence research, and high-performance cross-platform software engineering.",
              ),
            ),
            const SizedBox(height: 50),

            // Main 2-Column Content
            isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column: Introduction & Education Card
                      Expanded(
                        flex: 5,
                        child: _buildLeftAboutContent(context, isDark, theme),
                      ),
                      const SizedBox(width: 40),
                      // Right Column: 6 Domain Cards
                      Expanded(
                        flex: 6,
                        child: _buildRightDomainGrid(context, isDark, theme),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _buildLeftAboutContent(context, isDark, theme),
                      const SizedBox(height: 40),
                      _buildRightDomainGrid(context, isDark, theme),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftAboutContent(
    BuildContext context,
    bool isDark,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Showcase Card with Photo
        const FadeInAnimation(
          delay: Duration(milliseconds: 150),
          child: AboutProfileCard(),
        ),
        const SizedBox(height: 24),

        // Narrative Card
        FadeInAnimation(
          delay: const Duration(milliseconds: 250),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF0C1322).withValues(alpha: 0.8)
                  : Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: isDark ? const Color(0x1F38BDF8) : const Color(0x1A0284C7),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.primaryColor.withValues(alpha: 0.15),
                      ),
                      child: const Icon(
                        Icons.auto_stories_rounded,
                        color: AppTheme.primaryColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        "Engineering Philosophy & Journey",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: isDark ? Colors.white : const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  PortfolioData.aboutDescription,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    height: 1.8,
                    color: isDark
                        ? const Color(0xFF94A3B8)
                        : const Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Academic Foundation Card (Education)
        HoverLiftCard(
          liftAmount: -4,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        const Color(0xFF0F172A),
                        const Color(0xFF131F38),
                      ]
                    : [
                        const Color(0xFFF1F5F9),
                        Colors.white,
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.3),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF38BDF8).withValues(alpha: 0.08),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF38BDF8).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: Color(0xFF38BDF8),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Academic Degree",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF38BDF8),
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            PortfolioData.degree,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Divider(),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.account_balance_rounded,
                      size: 16,
                      color: Color(0xFF818CF8),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        PortfolioData.university,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? const Color(0xFFCBD5E1)
                              : const Color(0xFF334155),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.verified_rounded,
                      size: 16,
                      color: Color(0xFF34D399),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Polytechnic Diploma in Computer Science (Graduate)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? const Color(0xFF94A3B8)
                              : const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRightDomainGrid(
    BuildContext context,
    bool isDark,
    ThemeData theme,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 500;
        final childAspectRatio = isWide
            ? 1.35
            : (constraints.maxWidth < 400 ? 1.7 : 1.9);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWide ? 2 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: PortfolioData.domainCards.length,
          itemBuilder: (context, index) {
            final card = PortfolioData.domainCards[index];
            final color = card['color'] as Color;
            final icon = card['icon'];

            return HoverLiftCard(
              liftAmount: -5,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0C1322).withValues(alpha: 0.85)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: color.withValues(alpha: isDark ? 0.25 : 0.2),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: isDark ? 0.06 : 0.03),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: icon is IconData
                          ? Icon(icon, color: color, size: 20)
                          : FaIcon(icon as FaIconData, color: color, size: 20),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      card['title'] as String,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      card['description'] as String,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: isDark
                            ? const Color(0xFF94A3B8)
                            : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
