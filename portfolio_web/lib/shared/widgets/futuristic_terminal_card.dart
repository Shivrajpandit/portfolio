import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';
import '../../utils/portfolio_data.dart';

class FuturisticTerminalCard extends StatefulWidget {
  const FuturisticTerminalCard({super.key});

  @override
  State<FuturisticTerminalCard> createState() => _FuturisticTerminalCardState();
}

class _FuturisticTerminalCardState extends State<FuturisticTerminalCard> {
  int _activeTab = 0;

  final List<Map<String, dynamic>> _tabs = [
    {
      "name": "ai_pipeline.py",
      "icon": Icons.psychology_rounded,
      "color": Color(0xFF38BDF8),
      "lines": [
        "import numpy as np",
        "import ml_engine as ml",
        "",
        "# Target: Skill Gap Analysis Model",
        "class CareerSkillAnalyzer:",
        "    def __init__(self, target_role: str):",
        "        self.role_vector = ml.load_taxonomy(target_role)",
        "        self.model = ml.EmbeddingModel.load('neural_v3')",
        "",
        "    def compute_gap(self, candidate_skills: list):",
        "        user_vector = self.model.encode(candidate_skills)",
        "        gap_matrix = self.role_vector - user_vector",
        "        roadmap = ml.generate_roadmap(gap_matrix)",
        "        return roadmap.prioritize(k=5)",
        "",
        "# Status: Ready for Inference ✓",
      ],
    },
    {
      "name": "server.go",
      "icon": Icons.dns_rounded,
      "color": Color(0xFF34D399),
      "lines": [
        "package main",
        "",
        "import (",
        "    \"context\"",
        "    \"api/v1/handlers\"",
        "    \"github.com/gin-gonic/gin\"",
        ")",
        "",
        "func StartServer(ctx context.Context) {",
        "    router := gin.Default()",
        "    api := router.Group(\"/api/v1\")",
        "    {",
        "        api.POST(\"/donors/match\", handlers.GeoMatch)",
        "        api.POST(\"/auth/otp\", handlers.VerifyOTP)",
        "    }",
        "    router.Run(\":8080\") // High concurrency listening",
        "}",
      ],
    },
    {
      "name": "developer.json",
      "icon": Icons.data_object_rounded,
      "color": Color(0xFFA855F7),
      "lines": [
        "{",
        "  \"name\": \"Shivraj Pandit\",",
        "  \"degree\": \"B.Tech Artificial Intelligence & Data Science\",",
        "  \"university\": \"Sanjivani University, Kopargaon\",",
        "  \"domains\": [\"AI/ML\", \"Data Science\", \"Flutter\", \"Golang\"],",
        "  \"status\": \"Building • Learning • Shipping\",",
        "  \"focus\": \"Intelligent Scalable Software\",",
        "  \"open_for_opportunities\": true",
        "}",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background Ambient Glow
        Positioned(
          top: -30,
          right: -30,
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppTheme.primaryColor.withValues(alpha: 0.25),
                  AppTheme.purpleAccent.withValues(alpha: 0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Main Terminal Card
        Container(
          constraints: const BoxConstraints(maxWidth: 580),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF0C1322).withValues(alpha: 0.9)
                : Colors.white.withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark
                  ? AppTheme.primaryColor.withValues(alpha: 0.25)
                  : const Color(0xFF0284C7).withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withValues(alpha: isDark ? 0.12 : 0.08),
                blurRadius: 40,
                offset: const Offset(0, 15),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.05),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Window Title Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF070B14).withValues(alpha: 0.95)
                          : const Color(0xFFF1F5F9),
                      border: Border(
                        bottom: BorderSide(
                          color: isDark
                              ? const Color(0x1AFFFFFF)
                              : const Color(0x1A000000),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // macOS style window dots
                        Row(
                          children: [
                            _windowDot(const Color(0xFFFF5F56)),
                            const SizedBox(width: 8),
                            _windowDot(const Color(0xFFFFBD2E)),
                            const SizedBox(width: 8),
                            _windowDot(const Color(0xFF27C93F)),
                          ],
                        ),
                        const SizedBox(width: 20),

                        // Tab Switchers
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(_tabs.length, (index) {
                                final tab = _tabs[index];
                                final isSelected = _activeTab == index;
                                return GestureDetector(
                                  onTap: () => setState(() => _activeTab = index),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 6),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? (isDark
                                              ? const Color(0xFF131D36)
                                              : Colors.white)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: isSelected
                                            ? (tab['color'] as Color)
                                                .withValues(alpha: 0.4)
                                            : Colors.transparent,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          tab['icon'] as IconData,
                                          size: 13,
                                          color: tab['color'] as Color,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          tab['name'] as String,
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontSize: 12,
                                            fontWeight: isSelected
                                                ? FontWeight.w700
                                                : FontWeight.w400,
                                            color: isSelected
                                                ? (isDark
                                                    ? Colors.white
                                                    : const Color(0xFF0F172A))
                                                : (isDark
                                                    ? const Color(0xFF64748B)
                                                    : const Color(0xFF94A3B8)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Code Content Body
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          (_tabs[_activeTab]['lines'] as List<String>).length,
                          (i) {
                            final line =
                                (_tabs[_activeTab]['lines'] as List<String>)[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 28,
                                    child: Text(
                                      "${i + 1}",
                                      style: TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 12,
                                        color: isDark
                                            ? const Color(0xFF334155)
                                            : const Color(0xFF94A3B8),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      line,
                                      style: _formatCodeLine(line, isDark),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Terminal Bottom Status Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF070B14).withValues(alpha: 0.9)
                          : const Color(0xFFF8FAFC),
                      border: Border(
                        top: BorderSide(
                          color: isDark
                              ? const Color(0x1AFFFFFF)
                              : const Color(0x1A000000),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF34D399),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Building • Learning • Shipping",
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? const Color(0xFF94A3B8)
                                    : const Color(0xFF475569),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "v2026.1 • AI Ready",
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            color: isDark
                                ? AppTheme.primaryColor
                                : const Color(0xFF0284C7),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Floating Accessory Card 1: Candidate Profile Tag (Top-Right)
        Positioned(
          top: -20,
          right: -15,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF38BDF8).withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/profile.jpeg",
                    width: 28,
                    height: 28,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.person,
                      size: 20,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      PortfolioData.name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    Text(
                      "AI & Data Science",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF38BDF8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Floating Accessory Card 2: Stack Tech Badge (Bottom-Left)
        Positioned(
          bottom: -15,
          left: -15,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF34D399).withValues(alpha: 0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified_rounded,
                  size: 16,
                  color: Color(0xFF34D399),
                ),
                const SizedBox(width: 8),
                Text(
                  "Sanjivani University • B.Tech",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _windowDot(Color color) {
    return Container(
      width: 11,
      height: 11,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  TextStyle _formatCodeLine(String line, bool isDark) {
    Color color = isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B);

    if (line.startsWith("#") || line.startsWith("//")) {
      color = isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8);
    } else if (line.contains("class ") || line.contains("def ") || line.contains("func ")) {
      color = const Color(0xFF38BDF8);
    } else if (line.contains("import ") || line.contains("from ") || line.contains("package ")) {
      color = const Color(0xFFA855F7);
    } else if (line.contains("\"") || line.contains("'")) {
      color = const Color(0xFF34D399);
    } else if (line.contains("return ") || line.contains("self.")) {
      color = const Color(0xFFF43F5E);
    }

    return TextStyle(
      fontFamily: 'monospace',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
      height: 1.4,
    );
  }
}
