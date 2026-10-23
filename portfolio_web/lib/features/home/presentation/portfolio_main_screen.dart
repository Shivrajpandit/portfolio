import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../about/presentation/about_screen.dart';
import '../../achievements/presentation/achievements_section.dart';
import '../../contact/presentation/contact_screen.dart';
import '../../experience/presentation/experience_screen.dart';
import '../../focus/presentation/current_focus_section.dart';
import '../../footer/presentation/footer_section.dart';
import '../../github/presentation/github_section.dart';
import '../../projects/presentation/projects_screen.dart';
import '../../resume/presentation/resume_section.dart';
import '../../skills/presentation/skills_screen.dart';
import '../../what_i_build/presentation/what_i_build_section.dart';
import 'home_screen.dart';
import '../../../shared/widgets/top_navigation_bar.dart';

class PortfolioMainScreen extends StatefulWidget {
  const PortfolioMainScreen({super.key});

  @override
  State<PortfolioMainScreen> createState() => _PortfolioMainScreenState();
}

class _PortfolioMainScreenState extends State<PortfolioMainScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _whatIBuildKey = GlobalKey();
  final GlobalKey _focusKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'home';

  void _scrollToSection(String section) {
    setState(() => _activeSection = section);

    GlobalKey? key;
    switch (section) {
      case 'home':
        key = _homeKey;
        break;
      case 'about':
        key = _aboutKey;
        break;
      case 'what-i-build':
        key = _whatIBuildKey;
        break;
      case 'focus':
        key = _focusKey;
        break;
      case 'skills':
        key = _skillsKey;
        break;
      case 'projects':
        key = _projectsKey;
        break;
      case 'journey':
      case 'experience':
        key = _journeyKey;
        break;
      case 'achievements':
        key = _achievementsKey;
        break;
      case 'contact':
        key = _contactKey;
        break;
    }

    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient Base
          Positioned.fill(
            child: Container(
              color: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
            ),
          ),

          // Ambient Radial Glow 1 (Top Left Cyan/Sky)
          Positioned(
            top: -150,
            left: -150,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryColor.withValues(alpha: isDark ? 0.12 : 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Ambient Radial Glow 2 (Center Right Purple/Indigo)
          Positioned(
            top: size.height * 0.35,
            right: -200,
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.indigoAccent.withValues(alpha: isDark ? 0.10 : 0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Ambient Radial Glow 3 (Bottom Left Emerald)
          Positioned(
            bottom: 300,
            left: -200,
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.emeraldAccent.withValues(alpha: isDark ? 0.08 : 0.04),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Grid Pattern Overlay
          Positioned.fill(
            child: Opacity(
              opacity: isDark ? 0.35 : 0.20,
              child: CustomPaint(painter: GridPainter(isDark: isDark)),
            ),
          ),

          // Main Scrollable Body Content
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 70), // Spacer for sticky navbar
                  HomeScreen(
                    key: _homeKey,
                    onExploreWorkPressed: () => _scrollToSection('projects'),
                    onContactPressed: () => _scrollToSection('contact'),
                  ),
                  const SizedBox(height: 40),
                  AboutScreen(key: _aboutKey),
                  WhatIBuildSection(key: _whatIBuildKey),
                  CurrentFocusSection(key: _focusKey),
                  SkillsScreen(key: _skillsKey),
                  ProjectsScreen(key: _projectsKey),
                  ExperienceScreen(key: _journeyKey),
                  AchievementsSection(key: _achievementsKey),
                  const GitHubSection(),
                  const ResumeSection(),
                  ContactScreen(key: _contactKey),
                  FooterSection(onNavClick: _scrollToSection),
                ],
              ),
            ),
          ),

          // Sticky Top Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopNavigationBar(
              onNavClick: _scrollToSection,
              activeSection: _activeSection,
            ),
          ),
        ],
      ),
    );
  }
}

// Subtle Engineering Grid Painter
class GridPainter extends CustomPainter {
  final bool isDark;

  const GridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (isDark ? Colors.white : const Color(0xFF0F172A))
          .withValues(alpha: 0.02)
      ..strokeWidth = 1.0;

    const gridSize = 45.0;

    // Vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
