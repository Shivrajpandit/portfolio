import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/theme.dart';
import '../../../models/skill_model.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/fade_in_animation.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  SkillCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    final filteredSkills = _selectedCategory == null
        ? PortfolioData.skills
        : PortfolioData.skills
            .where((s) => s.category == _selectedCategory)
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
            const FadeInAnimation(
              delay: Duration(milliseconds: 100),
              child: SectionHeader(
                badgeText: "Technical Proficiency",
                badgeIcon: Icons.code_rounded,
                title: "Skills & Technologies",
                subtitle:
                    "Core languages, AI & data tools, mobile frameworks, and backend stacks applied across real-world systems.",
              ),
            ),
            const SizedBox(height: 40),

            // Category Filter Bar
            FadeInAnimation(
              delay: const Duration(milliseconds: 200),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _filterChip("All Technologies", null, isDark),
                    _filterChip(
                      "Programming",
                      SkillCategory.programming,
                      isDark,
                    ),
                    _filterChip(
                      "AI & Data Science",
                      SkillCategory.aiAndData,
                      isDark,
                    ),
                    _filterChip(
                      "Mobile (Flutter)",
                      SkillCategory.mobile,
                      isDark,
                    ),
                    _filterChip(
                      "Backend & Cloud",
                      SkillCategory.backend,
                      isDark,
                    ),
                    _filterChip(
                      "Tools & DevOps",
                      SkillCategory.tools,
                      isDark,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),

            // Skills Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth >= 1050
                    ? 4
                    : (constraints.maxWidth >= 720
                        ? 3
                        : (constraints.maxWidth >= 480 ? 2 : 1));
                final childAspectRatio = crossAxisCount == 1
                    ? (constraints.maxWidth < 360 ? 1.7 : 1.9)
                    : (crossAxisCount == 2 ? 1.3 : 1.35);

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: filteredSkills.length,
                  itemBuilder: (context, index) {
                    final skill = filteredSkills[index];

                    return FadeInAnimation(
                      delay: Duration(milliseconds: 100 + (index * 40)),
                      child: HoverLiftCard(
                        liftAmount: -5,
                        child: Container(
                          padding: EdgeInsets.all(constraints.maxWidth < 400 ? 16 : 20),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF0C1322).withValues(alpha: 0.85)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: skill.color.withValues(alpha: isDark ? 0.25 : 0.18),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: skill.color
                                    .withValues(alpha: isDark ? 0.06 : 0.03),
                                blurRadius: 18,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: skill.color.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: skill.color.withValues(alpha: 0.3),
                                      ),
                                    ),
                                    child: skill.icon is IconData
                                        ? Icon(
                                            skill.icon as IconData,
                                            color: skill.color,
                                            size: 20,
                                          )
                                        : FaIcon(
                                            skill.icon as FaIconData,
                                            color: skill.color,
                                            size: 20,
                                          ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? const Color(0xFF131D36)
                                          : const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      skill.level,
                                      style: TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? const Color(0xFF94A3B8)
                                            : const Color(0xFF64748B),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    skill.name,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: isDark
                                          ? Colors.white
                                          : const Color(0xFF0F172A),
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    skill.categoryName,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: isDark
                                          ? const Color(0xFF64748B)
                                          : const Color(0xFF94A3B8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Widget _filterChip(String label, SkillCategory? category, bool isDark) {
    final isSelected = _selectedCategory == category;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => setState(() => _selectedCategory = category),
        backgroundColor: isDark
            ? const Color(0xFF0C1322).withValues(alpha: 0.8)
            : const Color(0xFFF1F5F9),
        selectedColor: isDark
            ? AppTheme.primaryColor.withValues(alpha: 0.2)
            : const Color(0xFF0284C7).withValues(alpha: 0.15),
        checkmarkColor: AppTheme.primaryColor,
        side: BorderSide(
          color: isSelected
              ? AppTheme.primaryColor
              : (isDark ? const Color(0x1F38BDF8) : const Color(0x1A0F172A)),
        ),
        labelStyle: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected
              ? (isDark ? AppTheme.primaryColor : const Color(0xFF0284C7))
              : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
