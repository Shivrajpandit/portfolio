import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/theme.dart';
import '../../../models/project_model.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/section_badge.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/project_case_study_modal.dart';
import '../../../shared/widgets/fade_in_animation.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 980;

    final categories = ["All", "AI & Data Science", "Full-Stack & Mobile", "Mobile App", "Web App"];

    final filteredProjects = _selectedCategory == "All"
        ? PortfolioData.projects
        : PortfolioData.projects
            .where((p) => p.category == _selectedCategory)
            .toList();

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
            // Section Header
            const FadeInAnimation(
              delay: Duration(milliseconds: 100),
              child: SectionHeader(
                badgeText: "Featured Work",
                badgeIcon: Icons.rocket_launch_rounded,
                title: "Featured Engineering Projects",
                subtitle:
                    "End-to-end intelligent software solutions, production mobile applications, and scalable backend microservices.",
              ),
            ),
            const SizedBox(height: 50),

            // FEATURED SHOWCASE 1: AI-Powered Career & Skill Gap Analyzer
            FadeInAnimation(
              delay: const Duration(milliseconds: 200),
              child: _buildFeaturedAiShowcase(context, isDark, theme, isDesktop),
            ),
            const SizedBox(height: 48),

            // FEATURED SHOWCASE 2: Blood Connect (Full-Stack Go + Flutter)
            FadeInAnimation(
              delay: const Duration(milliseconds: 250),
              child: _buildFeaturedBloodConnectShowcase(context, isDark, theme, isDesktop),
            ),
            const SizedBox(height: 60),

            // Sub-Heading for All Projects Grid
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore More Projects",
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Selected applications demonstrating engineering depth",
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Category Filter Pills
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((cat) {
                  final isSelected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(cat),
                      selected: isSelected,
                      onSelected: (_) => setState(() => _selectedCategory = cat),
                      backgroundColor: isDark
                          ? const Color(0xFF0C1322).withValues(alpha: 0.8)
                          : const Color(0xFFF1F5F9),
                      selectedColor: isDark
                          ? AppTheme.primaryColor.withValues(alpha: 0.2)
                          : const Color(0xFF0284C7).withValues(alpha: 0.15),
                      checkmarkColor: AppTheme.primaryColor,
                      labelStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected
                            ? (isDark ? AppTheme.primaryColor : const Color(0xFF0284C7))
                            : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
                      ),
                      side: BorderSide(
                        color: isSelected
                            ? AppTheme.primaryColor
                            : (isDark ? const Color(0x1F38BDF8) : const Color(0x1A0F172A)),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 36),

            // Projects Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth >= 950
                    ? 3
                    : (constraints.maxWidth >= 600 ? 2 : 1);
                final childAspectRatio = crossAxisCount == 1
                    ? (constraints.maxWidth < 400 ? 1.25 : 1.45)
                    : (crossAxisCount == 2 ? 1.15 : 1.05);

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 22,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: filteredProjects.length,
                  itemBuilder: (context, index) {
                    final project = filteredProjects[index];
                    return FadeInAnimation(
                      delay: Duration(milliseconds: 100 + (index * 60)),
                      child: _buildProjectCard(context, project, isDark, theme),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // 1. Featured AI Career Analyzer Showcase
  Widget _buildFeaturedAiShowcase(
    BuildContext context,
    bool isDark,
    ThemeData theme,
    bool isDesktop,
  ) {
    final project = PortfolioData.projects[0]; // AI Analyzer

    final workflowSteps = [
      {"icon": Icons.person_search_rounded, "label": "User Profile", "sub": "Goal & Input"},
      {"icon": Icons.psychology_rounded, "label": "Skill Vector", "sub": "NLP Extraction"},
      {"icon": Icons.insights_rounded, "label": "AI Gap Model", "sub": "Matrix Delta"},
      {"icon": Icons.recommend_rounded, "label": "Recommender", "sub": "Weighted Scoring"},
      {"icon": Icons.route_rounded, "label": "Roadmap", "sub": "Adaptive Path"},
    ];

    return HoverLiftCard(
      liftAmount: -6,
      child: Container(
        padding: EdgeInsets.all(isDesktop ? 36 : 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    const Color(0xFF0C1322),
                    const Color(0xFF0B172E),
                  ]
                : [
                    Colors.white,
                    const Color(0xFFF8FAFC),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xFF38BDF8).withValues(alpha: 0.4),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF38BDF8).withValues(alpha: isDark ? 0.12 : 0.05),
              blurRadius: 35,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Badge & Featured Label
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 8,
              children: [
                SectionBadge(
                  label: "FLAGSHIP AI PROJECT",
                  icon: Icons.auto_awesome_rounded,
                  color: const Color(0xFF38BDF8),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF34D399).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "AI & Machine Learning",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF34D399),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Title & Description
            Text(
              project.title,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: isDesktop ? 28 : 22,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              project.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                height: 1.7,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
              ),
            ),
            const SizedBox(height: 24),

            // AI Flow Diagram (User -> Goal -> Skill -> Gap -> Recommendations -> Roadmap)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF070B14) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.account_tree_rounded, size: 16, color: Color(0xFF38BDF8)),
                      SizedBox(width: 8),
                      Text(
                        "AI Processing Workflow Diagram",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF38BDF8),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(workflowSteps.length, (i) {
                        final step = workflowSteps[i];
                        final isLast = i == workflowSteps.length - 1;

                        return Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                color: isDark ? const Color(0xFF111D36) : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFF38BDF8).withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    step['icon'] as IconData,
                                    size: 18,
                                    color: const Color(0xFF38BDF8),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        step['label'] as String,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: isDark ? Colors.white : const Color(0xFF0F172A),
                                        ),
                                      ),
                                      Text(
                                        step['sub'] as String,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (!isLast)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 16,
                                  color: const Color(0xFF38BDF8).withValues(alpha: 0.6),
                                ),
                              ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tech Stack & Action Buttons
            if (isDesktop)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.techStack.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF38BDF8).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF38BDF8),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () => ProjectCaseStudyModal.show(context, project),
                    icon: const Icon(Icons.fullscreen_rounded, size: 16),
                    label: const Text("View Case Study"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38BDF8),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.techStack.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF38BDF8).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
                          ),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF38BDF8),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => ProjectCaseStudyModal.show(context, project),
                    icon: const Icon(Icons.fullscreen_rounded, size: 16),
                    label: const Text("View Case Study"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38BDF8),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // 2. Featured Blood Connect Showcase
  Widget _buildFeaturedBloodConnectShowcase(
    BuildContext context,
    bool isDark,
    ThemeData theme,
    bool isDesktop,
  ) {
    final project = PortfolioData.projects[1]; // Blood Connect

    final archComponents = [
      {"layer": "Client", "name": "Flutter App", "desc": "Clean Arch & BLoC", "color": Color(0xFF64FFDA)},
      {"layer": "API Gateway", "name": "Golang Server", "desc": "High Concurrency REST", "color": Color(0xFF00ADD8)},
      {"layer": "Service & Repo", "name": "Business Layer", "desc": "Geo Indexing & Match", "color": Color(0xFF818CF8)},
      {"layer": "Data Layer", "name": "MongoDB Atlas", "desc": "Geo-Spatial Storage", "color": Color(0xFF34D399)},
      {"layer": "Cloud Auth", "name": "Firebase + JWT", "desc": "OTP Verification & Cloudinary", "color": Color(0xFFFBBF24)},
    ];

    return HoverLiftCard(
      liftAmount: -6,
      child: Container(
        padding: EdgeInsets.all(isDesktop ? 36 : 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    const Color(0xFF0C1322),
                    const Color(0xFF1E1018),
                  ]
                : [
                    Colors.white,
                    const Color(0xFFFFF1F2),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xFFEF4444).withValues(alpha: 0.4),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFEF4444).withValues(alpha: isDark ? 0.12 : 0.05),
              blurRadius: 35,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Badge
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 8,
              children: [
                SectionBadge(
                  label: "PRODUCTION FULL-STACK SYSTEM",
                  icon: Icons.favorite_rounded,
                  color: const Color(0xFFEF4444),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00ADD8).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Flutter • Golang • MongoDB",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF00ADD8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Title & Description
            Text(
              project.title,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: isDesktop ? 28 : 22,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              project.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                height: 1.7,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
              ),
            ),
            const SizedBox(height: 24),

            // Architecture Breakdown Strip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF070B14) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFEF4444).withValues(alpha: 0.25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.hub_rounded, size: 16, color: Color(0xFFEF4444)),
                      SizedBox(width: 8),
                      Text(
                        "Multi-Tier Microservice Architecture",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFEF4444),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(archComponents.length, (i) {
                        final comp = archComponents[i];
                        final isLast = i == archComponents.length - 1;
                        final cColor = comp['color'] as Color;

                        return Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                color: isDark ? const Color(0xFF111D36) : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: cColor.withValues(alpha: 0.35),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comp['layer'] as String,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: cColor,
                                    ),
                                  ),
                                  Text(
                                    comp['name'] as String,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                                    ),
                                  ),
                                  Text(
                                    comp['desc'] as String,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (!isLast)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 16,
                                  color: const Color(0xFFEF4444).withValues(alpha: 0.6),
                                ),
                              ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tech Stack & Action Buttons
            if (isDesktop)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.techStack.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF4444).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFFEF4444).withValues(alpha: 0.25),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFEF4444),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (project.githubUrl != null)
                        IconButton(
                          onPressed: () => _launch(project.githubUrl!),
                          icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                          tooltip: "Source Code",
                          style: IconButton.styleFrom(
                            foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
                          ),
                        ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () => ProjectCaseStudyModal.show(context, project),
                        icon: const Icon(Icons.fullscreen_rounded, size: 16),
                        label: const Text("View Case Study"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF4444),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.techStack.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFFEF4444).withValues(alpha: 0.25),
                          ),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (project.githubUrl != null)
                        IconButton(
                          onPressed: () => _launch(project.githubUrl!),
                          icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                          tooltip: "Source Code",
                          style: IconButton.styleFrom(
                            foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
                          ),
                        ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () => ProjectCaseStudyModal.show(context, project),
                        icon: const Icon(Icons.fullscreen_rounded, size: 16),
                        label: const Text("View Case Study"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF4444),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // 3. Grid Project Card
  Widget _buildProjectCard(
    BuildContext context,
    ProjectModel project,
    bool isDark,
    ThemeData theme,
  ) {
    return HoverLiftCard(
      liftAmount: -5,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0C1322).withValues(alpha: 0.85) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: project.primaryColor.withValues(alpha: isDark ? 0.25 : 0.2),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: project.primaryColor.withValues(alpha: isDark ? 0.08 : 0.04),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: Category & Action Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: project.primaryColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    project.category,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: project.primaryColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (project.githubUrl != null)
                      IconButton(
                        onPressed: () => _launch(project.githubUrl!),
                        icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                        tooltip: "GitHub",
                        style: IconButton.styleFrom(
                          foregroundColor: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                        ),
                      ),
                    if (project.liveUrl != null)
                      IconButton(
                        onPressed: () => _launch(project.liveUrl!),
                        icon: const Icon(Icons.launch_rounded, size: 16),
                        tooltip: "Live Demo",
                        style: IconButton.styleFrom(
                          foregroundColor: project.primaryColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Title & Description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.tagline,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tech Stack & Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.techStack.take(3).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF131D36) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                TextButton(
                  onPressed: () => ProjectCaseStudyModal.show(context, project),
                  style: TextButton.styleFrom(
                    foregroundColor: project.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Case Study",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, size: 14),
                    ],
                  ),
                ),
              ],
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
