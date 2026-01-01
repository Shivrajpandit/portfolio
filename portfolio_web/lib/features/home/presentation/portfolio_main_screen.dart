import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../about/presentation/about_screen.dart';
import '../../contact/presentation/contact_screen.dart';
import '../../experience/presentation/experience_screen.dart';
import '../../projects/presentation/projects_screen.dart';
import '../../skills/presentation/skills_screen.dart';
import 'home_screen.dart';
import '../../../shared/widgets/entrance_fader.dart';
import '../../../shared/widgets/top_navigation_bar.dart';
import '../../../shared/widgets/animated_background.dart';

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
          // Background Layer
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0A192F), // Theme Secondary
                    Color(0xFF020c1b), // Deep Dark Navy
                  ],
                ),
              ),
            ),
          ),
          // Dark Overlay for contrast
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.7)),
          ),

          // Animated Particles Layer
          const Positioned.fill(
            child: IgnorePointer(child: AnimatedBackground()),
          ),
          // Decorative Glow 1 (Top Right)
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryColor.withOpacity(0.15),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.6],
                ),
              ),
            ),
          ),
          // Decorative Glow 2 (Bottom Left)
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF8892B0).withOpacity(0.1), // Subtext color
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.6],
                ),
              ),
            ),
          ),
          // Content Layer
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Add padding top to account for navbar height
                  EntranceFader(
                    delay: const Duration(milliseconds: 100),
                    child: HomeScreen(key: _homeKey),
                  ),
                  EntranceFader(
                    offset: const Offset(0, 50),
                    delay: const Duration(milliseconds: 200),
                    child: AboutScreen(key: _aboutKey),
                  ),
                  EntranceFader(
                    offset: const Offset(0, 50),
                    delay: const Duration(milliseconds: 300),
                    child: SkillsScreen(key: _skillsKey),
                  ),
                  EntranceFader(
                    offset: const Offset(0, 50),
                    delay: const Duration(milliseconds: 400),
                    child: ExperienceScreen(key: _experienceKey),
                  ),
                  EntranceFader(
                    offset: const Offset(0, 50),
                    delay: const Duration(milliseconds: 500),
                    child: ProjectsScreen(key: _projectsKey),
                  ),
                  EntranceFader(
                    offset: const Offset(0, 50),
                    delay: const Duration(milliseconds: 600),
                    child: ContactScreen(key: _contactKey),
                  ),
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

          // Navbar Layer (Glassmorphism)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: const Color(0xFF0A192F).withOpacity(0.85),
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
