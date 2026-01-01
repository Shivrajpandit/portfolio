import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../about/presentation/about_screen.dart';
import '../../contact/presentation/contact_screen.dart';
import '../../experience/presentation/experience_screen.dart';
import '../../projects/presentation/projects_screen.dart';
import '../../skills/presentation/skills_screen.dart';
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
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(String section) {
    GlobalKey? key;
    switch (section) {
      case 'home':
        key = _homeKey;
        break;
      case 'about':
        key = _aboutKey;
        break;
      case 'skills':
        key = _skillsKey;
        break;
      case 'experience':
        key = _experienceKey;
        break;
      case 'projects':
        key = _projectsKey;
        break;
      case 'contact':
        key = _contactKey;
        break;
    }

    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
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
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background Layer
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0A192F), // Dark Navy
                    Color(0xFF020c1b), // Deeper Navy
                    Color(0xFF0D1B2A), // Dark Blue
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          // Mesh Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 1.5,
                  colors: [
                    AppTheme.primaryColor.withOpacity(0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Decorative Glow 1 (Top Right)
          Positioned(
            top: -200,
            right: -100,
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryColor.withOpacity(0.12),
                    AppTheme.accentColor.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Decorative Glow 2 (Bottom Left)
          Positioned(
            bottom: -200,
            left: -100,
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.purpleAccent.withOpacity(0.1),
                    AppTheme.pinkAccent.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Decorative Glow 3 (Center Right)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.accentColor.withOpacity(0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Grid Pattern Overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: CustomPaint(painter: GridPainter()),
            ),
          ),

          // Content Layer
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HomeScreen(key: _homeKey),
                  const SizedBox(height: 100),
                  AboutScreen(key: _aboutKey),
                  const SizedBox(height: 100),
                  SkillsScreen(key: _skillsKey),
                  const SizedBox(height: 100),
                  ExperienceScreen(key: _experienceKey),
                  const SizedBox(height: 100),
                  ProjectsScreen(key: _projectsKey),
                  const SizedBox(height: 100),
                  ContactScreen(key: _contactKey),
                  // Footer
                  Container(
                    color: const Color(0xFF020c1b),
                    padding: const EdgeInsets.all(20),
                    child: const Center(
                      child: Text(
                        "Designed & Built by Shivraj Pandit",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Navbar Layer (Enhanced Glassmorphism)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A192F).withOpacity(0.8),
                    border: Border(
                      bottom: BorderSide(
                        color: AppTheme.primaryColor.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: TopNavigationBar(onNavClick: _scrollToSection),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Grid Pattern Painter
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.02)
      ..strokeWidth = 1.0;

    const gridSize = 50.0;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
