import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/theme.dart';
import '../../../../utils/portfolio_data.dart';
import '../../../../shared/widgets/section_badge.dart';
import '../../../../shared/widgets/futuristic_terminal_card.dart';
import '../../../../shared/widgets/fade_in_animation.dart';
import '../../../../shared/widgets/resume_viewer_modal.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onExploreWorkPressed;
  final VoidCallback? onContactPressed;

  const HeroSection({
    super.key,
    this.onExploreWorkPressed,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 980;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.88,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 60 : (width > 600 ? 32 : 20),
        vertical: isDesktop ? 60 : 40,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Column: Text & CTAs
                  Expanded(
                    flex: 6,
                    child: _buildLeftHeroContent(context, theme, isDark, isDesktop, width),
                  ),
                  const SizedBox(width: 48),
                  // Right Column: Futuristic Terminal Workspace
                  const Expanded(
                    flex: 5,
                    child: FadeInAnimation(
                      delay: Duration(milliseconds: 300),
                      slideOffset: Offset(0.1, 0),
                      child: FuturisticTerminalCard(),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLeftHeroContent(context, theme, isDark, isDesktop, width),
                  const SizedBox(height: 50),
                  const FuturisticTerminalCard(),
                ],
              ),
      ),
    );
  }

  Widget _buildLeftHeroContent(
    BuildContext context,
    ThemeData theme,
    bool isDark,
    bool isDesktop,
    double width,
  ) {
    final headlineSize = isDesktop
        ? 52.0
        : (width < 380 ? 25.0 : (width < 450 ? 28.0 : 34.0));

    return Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top Glowing Badge
        FadeInAnimation(
          delay: const Duration(milliseconds: 100),
          child: SectionBadge(
            label: PortfolioData.heroBadge,
            icon: Icons.auto_awesome_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 22),

        // Main Headline with Gradient Accent
        FadeInAnimation(
          delay: const Duration(milliseconds: 200),
          child: RichText(
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
            text: TextSpan(
              style: theme.textTheme.displayLarge?.copyWith(
                fontSize: headlineSize,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.0,
                height: 1.15,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
              children: [
                const TextSpan(text: "Building "),
                WidgetSpan(
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        AppTheme.primaryColor,
                        AppTheme.indigoAccent,
                        AppTheme.purpleAccent,
                      ],
                    ).createShader(bounds),
                    child: Text(
                      "intelligent software",
                      style: TextStyle(
                        fontSize: headlineSize,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.0,
                        color: Colors.white,
                        fontFamily: theme.textTheme.displayLarge?.fontFamily,
                      ),
                    ),
                  ),
                ),
                const TextSpan(text: " for real-world problems."),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Description
        FadeInAnimation(
          delay: const Duration(milliseconds: 300),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(
              PortfolioData.heroDescription,
              textAlign: isDesktop ? TextAlign.start : TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: isDesktop ? 17 : 15,
                height: 1.7,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Action Buttons Row (Explore My Work & Resume)
        FadeInAnimation(
          delay: const Duration(milliseconds: 400),
          child: Wrap(
            spacing: 16,
            runSpacing: 14,
            alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
            children: [
              // CTA 1: Explore Work
              ElevatedButton.icon(
                onPressed: onExploreWorkPressed,
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: const Text("Explore My Work"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ),

              // CTA 2: View Resume
              OutlinedButton.icon(
                onPressed: () => ResumeViewerModal.show(context),
                icon: const Icon(Icons.description_outlined, size: 18),
                label: const Text("View Resume"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  side: BorderSide(
                    color: isDark
                        ? const Color(0x3338BDF8)
                        : const Color(0x330284C7),
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),

        // Social Links Strip
        FadeInAnimation(
          delay: const Duration(milliseconds: 500),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment:
                isDesktop ? WrapAlignment.start : WrapAlignment.center,
            children: [
              Text(
                "Connect:",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                ),
              ),
              _socialChip(
                icon: FontAwesomeIcons.github,
                label: "GitHub",
                onTap: () => _launch(PortfolioData.githubUrl),
                isDark: isDark,
              ),
              _socialChip(
                icon: FontAwesomeIcons.linkedin,
                label: "LinkedIn",
                onTap: () => _launch(PortfolioData.linkedinUrl),
                isDark: isDark,
              ),
              _socialChip(
                icon: Icons.email_rounded,
                label: "Email",
                onTap: () => _launch("mailto:${PortfolioData.email}"),
                isDark: isDark,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _socialChip({
    required dynamic icon,
    required String label,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDark ? const Color(0x1AFFFFFF) : const Color(0x1A000000),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon is IconData
                ? Icon(
                    icon,
                    size: 14,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                  )
                : FaIcon(
                    icon as FaIconData,
                    size: 14,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                  ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
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
