import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/theme.dart';
import '../../core/theme/theme_manager.dart';
import '../../utils/portfolio_data.dart';
import 'resume_viewer_modal.dart';

class MobileNavigationDrawer extends StatelessWidget {
  final Function(String) onNavClick;

  const MobileNavigationDrawer({super.key, required this.onNavClick});

  static void show(BuildContext context, Function(String) onNavClick) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MobileNavigationDrawer(onNavClick: onNavClick),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final navItems = [
      {"name": "Home", "section": "home", "icon": Icons.home_rounded},
      {"name": "About", "section": "about", "icon": Icons.person_rounded},
      {"name": "Skills", "section": "skills", "icon": Icons.code_rounded},
      {"name": "What I Build", "section": "what-i-build", "icon": Icons.layers_rounded},
      {"name": "Focus", "section": "focus", "icon": Icons.bolt_rounded},
      {"name": "Projects", "section": "projects", "icon": Icons.rocket_launch_rounded},
      {"name": "Journey", "section": "journey", "icon": Icons.timeline_rounded},
      {"name": "Achievements", "section": "achievements", "icon": Icons.military_tech_rounded},
      {"name": "Contact", "section": "contact", "icon": Icons.mail_rounded},
    ];

    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF0C1322).withValues(alpha: 0.95)
              : Colors.white.withValues(alpha: 0.98),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          border: Border.all(
            color: isDark ? const Color(0x1F38BDF8) : const Color(0x1A0F172A),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Header Row: Logo & Theme Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  PortfolioData.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppTheme.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () => ThemeManager.instance.toggleTheme(),
                  icon: Icon(
                    isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: AppTheme.primaryColor,
                  ),
                  tooltip: "Toggle Theme",
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),

            // Navigation Links
            ...navItems.map((item) {
              return ListTile(
                leading: Icon(
                  item['icon'] as IconData,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
                title: Text(
                  item['name'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  onNavClick(item['section'] as String);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _launch(PortfolioData.githubUrl);
                    },
                    icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                    label: const Text("GitHub"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ResumeViewerModal.show(context);
                    },
                    icon: const Icon(Icons.description_rounded, size: 16),
                    label: const Text("Resume"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
