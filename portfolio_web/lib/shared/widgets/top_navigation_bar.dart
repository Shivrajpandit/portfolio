import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/theme.dart';
import '../../core/theme/theme_manager.dart';
import '../../utils/portfolio_data.dart';
import 'mobile_navigation_drawer.dart';
import 'resume_viewer_modal.dart';

class TopNavigationBar extends StatelessWidget {
  final Function(String)? onNavClick;
  final String activeSection;

  const TopNavigationBar({
    super.key,
    this.onNavClick,
    this.activeSection = 'home',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1180;
    final isCompact = width < 420;

    return ClipRRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF060913).withValues(alpha: 0.8)
                : Colors.white.withValues(alpha: 0.85),
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? const Color(0x1F38BDF8)
                    : const Color(0x1A0284C7),
                width: 1,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width > 1300 ? 50 : 16,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo
              InkWell(
                onTap: () => onNavClick?.call('home'),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppTheme.primaryColor,
                              AppTheme.indigoAccent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryColor.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "SP",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      if (!isCompact) ...[
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              PortfolioData.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: isDark
                                    ? Colors.white
                                    : const Color(0xFF0F172A),
                                letterSpacing: -0.3,
                              ),
                            ),
                            Text(
                              "AI & Software Developer",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: isDark
                                    ? AppTheme.primaryColor
                                    : const Color(0xFF0284C7),
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        const SizedBox(width: 8),
                        Text(
                          "Shivraj P.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: isDark
                                ? Colors.white
                                : const Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Desktop Navigation Links
              if (isDesktop)
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _navItem(context, 'Home', 'home'),
                          _navItem(context, 'About', 'about'),
                          _navItem(context, 'Skills', 'skills'),
                          _navItem(context, 'What I Build', 'what-i-build'),
                          _navItem(context, 'Projects', 'projects'),
                          _navItem(context, 'Journey', 'journey'),
                          _navItem(context, 'Achievements', 'achievements'),
                          _navItem(context, 'Contact', 'contact'),
                        ],
                      ),
                    ),
                  ),
                ),

              // Right Action Buttons
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Theme Mode Toggle
                  IconButton(
                    onPressed: () => ThemeManager.instance.toggleTheme(),
                    icon: Icon(
                      isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      size: 20,
                      color: isDark
                          ? const Color(0xFFFBBF24)
                          : const Color(0xFF0284C7),
                    ),
                    tooltip: isDark ? "Switch to Light Mode" : "Switch to Dark Mode",
                  ),
                  const SizedBox(width: 8),

                  if (isDesktop) ...[
                    // GitHub Link
                    IconButton(
                      onPressed: () => _launch(PortfolioData.githubUrl),
                      icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                      tooltip: "GitHub Profile",
                      style: IconButton.styleFrom(
                        foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Resume CTA Button
                    ElevatedButton.icon(
                      onPressed: () => ResumeViewerModal.show(context),
                      icon: const Icon(Icons.description_rounded, size: 15),
                      label: const Text("Resume"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ] else ...[
                    // Mobile Hamburger Menu Button
                    IconButton(
                      icon: const Icon(Icons.menu_rounded, size: 26),
                      color: AppTheme.primaryColor,
                      onPressed: () {
                        MobileNavigationDrawer.show(
                          context,
                          (section) => onNavClick?.call(section),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, String section) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isActive = activeSection == section;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TextButton(
        onPressed: () => onNavClick?.call(section),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: isActive
              ? (isDark
                  ? AppTheme.primaryColor.withValues(alpha: 0.1)
                  : const Color(0xFF0284C7).withValues(alpha: 0.08))
              : Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive
                ? (isDark ? AppTheme.primaryColor : const Color(0xFF0284C7))
                : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
          ),
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
