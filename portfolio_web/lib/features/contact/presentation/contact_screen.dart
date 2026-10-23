import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/fade_in_animation.dart';
import 'widgets/contact_form.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

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
                badgeText: "Get In Touch",
                badgeIcon: Icons.mail_rounded,
                title: "Let's build something meaningful.",
                subtitle:
                    "I'm open to interesting projects, engineering collaborations, internships, and full-time opportunities.",
              ),
            ),
            const SizedBox(height: 50),

            isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left: Direct contact channels & info
                      Expanded(
                        flex: 5,
                        child: _buildContactInfoCards(context, isDark, theme),
                      ),
                      const SizedBox(width: 40),
                      // Right: Interactive Contact Form
                      const Expanded(
                        flex: 6,
                        child: FadeInAnimation(
                          delay: Duration(milliseconds: 200),
                          child: ContactForm(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _buildContactInfoCards(context, isDark, theme),
                      const SizedBox(height: 40),
                      const ContactForm(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCards(
    BuildContext context,
    bool isDark,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          icon: Icons.email_rounded,
          title: "Email",
          subtitle: "Direct Inbox",
          value: PortfolioData.email,
          color: const Color(0xFF38BDF8),
          onTap: () => _launch("mailto:${PortfolioData.email}"),
          isDark: isDark,
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: FontAwesomeIcons.linkedin,
          title: "LinkedIn",
          subtitle: "Professional Network",
          value: "Connect with Shivraj Pandit",
          color: const Color(0xFF0A66C2),
          onTap: () => _launch(PortfolioData.linkedinUrl),
          isDark: isDark,
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: FontAwesomeIcons.github,
          title: "GitHub",
          subtitle: "Open Source Code",
          value: "github.com/Shivrajpandit",
          color: isDark ? Colors.white : const Color(0xFF0F172A),
          onTap: () => _launch(PortfolioData.githubUrl),
          isDark: isDark,
        ),
        const SizedBox(height: 24),

        // University & Location Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF0C1322).withValues(alpha: 0.8)
                : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isDark ? const Color(0x1F38BDF8) : const Color(0x1A0F172A),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.location_on_rounded,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Location & University",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Sanjivani University, Kopargaon • Maharashtra, India",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required dynamic icon,
    required String title,
    required String subtitle,
    required String value,
    required Color color,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return HoverLiftCard(
      liftAmount: -4,
      onTap: onTap,
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: color.withValues(alpha: 0.3)),
              ),
              child: icon is IconData
                  ? Icon(icon, color: color, size: 20)
                  : FaIcon(icon as FaIconData, color: color, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              size: 16,
              color: AppTheme.primaryColor,
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
