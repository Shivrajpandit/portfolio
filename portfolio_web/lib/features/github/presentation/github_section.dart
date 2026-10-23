import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/fade_in_animation.dart';

class GitHubSection extends StatelessWidget {
  const GitHubSection({super.key});

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
                badgeText: "Open Source & Code",
                badgeIcon: FontAwesomeIcons.github,
                title: "GitHub Repositories",
                subtitle:
                    "Explore public repositories, code architectures, mobile apps, and developer experiments on my GitHub profile.",
              ),
            ),
            const SizedBox(height: 50),

            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 900;
                final childAspectRatio = isWide
                    ? 2.2
                    : (constraints.maxWidth < 400 ? 1.4 : 1.6);

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isWide ? 2 : 1,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 22,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: PortfolioData.githubRepos.length,
                  itemBuilder: (context, index) {
                    final repo = PortfolioData.githubRepos[index];
                    final color = repo['color'] as Color;

                    return FadeInAnimation(
                      delay: Duration(milliseconds: 150 + (index * 70)),
                      child: HoverLiftCard(
                        liftAmount: -4,
                        onTap: () => _launch(repo['url'] as String),
                        child: Container(
                          padding: EdgeInsets.all(
                            constraints.maxWidth < 400 ? 18 : 24,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF0C1322).withValues(alpha: 0.85)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isDark
                                  ? const Color(0x1F38BDF8)
                                  : const Color(0x1A0F172A),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
                                blurRadius: 18,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.bookBookmark,
                                          size: 16,
                                          color: AppTheme.primaryColor,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            repo['name'] as String,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: isDark
                                                  ? Colors.white
                                                  : const Color(0xFF0F172A),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.arrow_outward_rounded,
                                    size: 18,
                                    color: AppTheme.primaryColor,
                                  ),
                                ],
                              ),
                              Text(
                                repo['description'] as String,
                                style: TextStyle(
                                  fontSize: 13,
                                  height: 1.5,
                                  color: isDark
                                      ? const Color(0xFF94A3B8)
                                      : const Color(0xFF64748B),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: color,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        repo['language'] as String,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: isDark
                                              ? const Color(0xFFCBD5E1)
                                              : const Color(0xFF475569),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? const Color(0xFF131D36)
                                          : const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      repo['stars'] as String,
                                      style: TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.primaryColor,
                                      ),
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
            const SizedBox(height: 36),

            // Main GitHub Profile CTA
            OutlinedButton.icon(
              onPressed: () => _launch(PortfolioData.githubUrl),
              icon: const FaIcon(FontAwesomeIcons.github, size: 16),
              label: const Text("View All Repositories on GitHub"),
              style: OutlinedButton.styleFrom(
                foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                side: BorderSide(
                  color: isDark ? const Color(0x3338BDF8) : const Color(0x330284C7),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
