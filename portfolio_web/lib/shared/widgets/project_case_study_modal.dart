import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project_model.dart';
import 'section_badge.dart';

class ProjectCaseStudyModal extends StatelessWidget {
  final ProjectModel project;

  const ProjectCaseStudyModal({super.key, required this.project});

  static void show(BuildContext context, ProjectModel project) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (context) => ProjectCaseStudyModal(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 40,
          vertical: isMobile ? 24 : 40,
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900, maxHeight: 850),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0C1322) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: project.primaryColor.withValues(alpha: 0.35),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: project.primaryColor.withValues(alpha: 0.2),
                blurRadius: 50,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                // Top Header Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF070B14)
                        : const Color(0xFFF8FAFC),
                    border: Border(
                      bottom: BorderSide(
                        color: isDark ? const Color(0x1AFFFFFF) : const Color(0x1A000000),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SectionBadge(
                        label: project.category,
                        color: project.primaryColor,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close_rounded),
                        tooltip: "Close",
                      ),
                    ],
                  ),
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(isMobile ? 20 : 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title & Tagline
                        Text(
                          project.title,
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          project.tagline,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: project.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Action Links Row
                        Wrap(
                          spacing: 14,
                          runSpacing: 12,
                          children: [
                            if (project.githubUrl != null)
                              _buildActionButton(
                                icon: FontAwesomeIcons.github,
                                label: "View Source Code",
                                color: isDark
                                    ? Colors.white
                                    : const Color(0xFF0F172A),
                                isFilled: false,
                                onTap: () => _launch(project.githubUrl!),
                              ),
                            if (project.liveUrl != null)
                              _buildActionButton(
                                icon: Icons.launch_rounded,
                                label: "Open Live Demo",
                                color: project.primaryColor,
                                isFilled: true,
                                onTap: () => _launch(project.liveUrl!),
                              ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const Divider(),
                        const SizedBox(height: 24),

                        // Problem & Solution
                        _buildSectionBlock(
                          title: "The Problem",
                          icon: Icons.warning_amber_rounded,
                          color: const Color(0xFFFBBF24),
                          content: project.problem,
                          theme: theme,
                        ),
                        const SizedBox(height: 20),
                        _buildSectionBlock(
                          title: "The Engineering Solution",
                          icon: Icons.lightbulb_outline_rounded,
                          color: const Color(0xFF34D399),
                          content: project.solution,
                          theme: theme,
                        ),
                        const SizedBox(height: 28),

                        // Visual Architecture Flow Diagram
                        Text(
                          "System Architecture & Data Flow",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildArchitectureFlow(isDark, isMobile),
                        const SizedBox(height: 32),

                        // Key Features
                        Text(
                          "Core Features & Functionality",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Column(
                          children: project.features.map((feature) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    size: 18,
                                    color: project.primaryColor,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      feature,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 28),

                        // Tech Stack Badges
                        Text(
                          "Technologies & Tools",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: project.techStack.map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: project.primaryColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: project.primaryColor.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: project.primaryColor,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 32),

                        // Technical Challenges & Outcome
                        if (project.challenges.isNotEmpty) ...[
                          _buildSectionBlock(
                            title: "Technical Challenges Overcome",
                            icon: Icons.hardware_rounded,
                            color: const Color(0xFF818CF8),
                            content: project.challenges.join("\n• "),
                            theme: theme,
                          ),
                          const SizedBox(height: 20),
                        ],
                        _buildSectionBlock(
                          title: "Impact & Outcome",
                          icon: Icons.emoji_events_rounded,
                          color: const Color(0xFFA855F7),
                          content: project.outcome,
                          theme: theme,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionBlock({
    required String title,
    required IconData icon,
    required Color color,
    required String content,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArchitectureFlow(bool isDark, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF070B14) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? const Color(0x1AFFFFFF) : const Color(0x1A000000),
        ),
      ),
      child: Column(
        children: List.generate(project.architecture.length, (index) {
          final isLast = index == project.architecture.length - 1;
          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF111D36) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: project.primaryColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: project.primaryColor.withValues(alpha: 0.15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: project.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        project.architecture[index],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    size: 16,
                    color: project.primaryColor.withValues(alpha: 0.6),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildActionButton({
    required dynamic icon,
    required String label,
    required Color color,
    required bool isFilled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: isFilled ? color : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isFilled ? Colors.transparent : color.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon is IconData
                ? Icon(
                    icon,
                    size: 16,
                    color: isFilled ? Colors.black : color,
                  )
                : FaIcon(
                    icon as FaIconData,
                    size: 16,
                    color: isFilled ? Colors.black : color,
                  ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isFilled ? Colors.black : color,
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
