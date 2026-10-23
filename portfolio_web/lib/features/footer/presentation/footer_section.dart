import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/portfolio_data.dart';

class FooterSection extends StatelessWidget {
  final Function(String)? onNavClick;

  const FooterSection({super.key, this.onNavClick});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 800;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF04070E) : const Color(0xFFF1F5F9),
        border: Border(
          top: BorderSide(
            color: isDark ? const Color(0x1F38BDF8) : const Color(0x1A0F172A),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 60 : (width > 600 ? 32 : 20),
        vertical: 48,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Column(
          children: [
            isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left branding
                      _buildBranding(isDark),
                      // Middle Navigation Links
                      _buildNavLinks(context, isDark),
                      // Right Socials
                      _buildSocials(isDark),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildBranding(isDark),
                      const SizedBox(height: 24),
                      _buildNavLinks(context, isDark),
                      const SizedBox(height: 24),
                      _buildSocials(isDark),
                    ],
                  ),
            const SizedBox(height: 36),
            const Divider(),
            const SizedBox(height: 24),

            // Bottom Copyright & Tagline
            isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "© 2026 Shivraj Pandit. All rights reserved.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                        ),
                      ),
                      Text(
                        "Designed for Impact & Performance",
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isDark ? AppTheme.primaryColor : const Color(0xFF0284C7),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "© 2026 Shivraj Pandit. All rights reserved.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Designed for Impact & Performance",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isDark ? AppTheme.primaryColor : const Color(0xFF0284C7),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBranding(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primaryColor, AppTheme.indigoAccent],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: const Text(
                "SP",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              PortfolioData.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Building. Learning. Shipping.",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "B.Tech AI & Data Science • Software Developer",
          style: TextStyle(
            fontSize: 12,
            color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  Widget _buildNavLinks(BuildContext context, bool isDark) {
    final links = [
      {"name": "Home", "sec": "home"},
      {"name": "About", "sec": "about"},
      {"name": "Skills", "sec": "skills"},
      {"name": "Projects", "sec": "projects"},
      {"name": "Journey", "sec": "journey"},
      {"name": "Contact", "sec": "contact"},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: links.map((link) {
        return InkWell(
          onTap: () => onNavClick?.call(link['sec'] as String),
          child: Text(
            link['name'] as String,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSocials(bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => _launch(PortfolioData.githubUrl),
          icon: const FaIcon(FontAwesomeIcons.github, size: 18),
          tooltip: "GitHub",
          style: IconButton.styleFrom(
            foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        IconButton(
          onPressed: () => _launch(PortfolioData.linkedinUrl),
          icon: const FaIcon(FontAwesomeIcons.linkedin, size: 18),
          tooltip: "LinkedIn",
          style: IconButton.styleFrom(
            foregroundColor: const Color(0xFF0A66C2),
          ),
        ),
        IconButton(
          onPressed: () => _launch("mailto:${PortfolioData.email}"),
          icon: const Icon(Icons.email_rounded, size: 20),
          tooltip: "Email",
          style: IconButton.styleFrom(
            foregroundColor: AppTheme.primaryColor,
          ),
        ),
      ],
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
