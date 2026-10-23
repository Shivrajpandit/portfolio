import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/theme.dart';
import '../../utils/portfolio_data.dart';
import 'section_badge.dart';

class ResumeViewerModal extends StatelessWidget {
  const ResumeViewerModal({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (context) => const ResumeViewerModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 40,
          vertical: isMobile ? 16 : 30,
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 950, maxHeight: 900),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0C1322) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppTheme.primaryColor.withValues(alpha: 0.35),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withValues(alpha: isDark ? 0.15 : 0.08),
                blurRadius: 50,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                // Modal Top Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF070B14) : const Color(0xFFF8FAFC),
                    border: Border(
                      bottom: BorderSide(
                        color: isDark ? const Color(0x1AFFFFFF) : const Color(0x1A000000),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: SectionBadge(
                          label: isMobile ? "Resume" : "Official Curriculum Vitae",
                          icon: Icons.verified_user_rounded,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () => _launch("mailto:${PortfolioData.email}"),
                        icon: const Icon(Icons.send_rounded, size: 14),
                        label: Text(isMobile ? "Contact" : "Contact Me"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 14, vertical: 8),
                          textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(width: 6),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close_rounded),
                        tooltip: "Close",
                      ),
                    ],
                  ),
                ),

                // Resume Document Sheet
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(isMobile ? 18 : 36),
                    child: Container(
                      padding: EdgeInsets.all(isMobile ? 20 : 36),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0A0F1D) : const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark ? const Color(0x1F38BDF8) : const Color(0x1A0F172A),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1. Header
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "SHIVRAJ PANDIT",
                                  style: TextStyle(
                                    fontSize: isMobile ? 24 : 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "AI & Data Science Student | Software Developer | Data Analytics | AI/ML | Flutter",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isMobile ? 12 : 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 12,
                                  runSpacing: 6,
                                  children: [
                                    _headerLink(Icons.location_on_rounded, "India", isDark),
                                    _headerLink(
                                      Icons.email_rounded,
                                      PortfolioData.email,
                                      isDark,
                                      onTap: () => _launch("mailto:${PortfolioData.email}"),
                                    ),
                                    _headerLink(
                                      FontAwesomeIcons.linkedin,
                                      "LinkedIn",
                                      isDark,
                                      onTap: () => _launch(PortfolioData.linkedinUrl),
                                    ),
                                    _headerLink(
                                      FontAwesomeIcons.github,
                                      "GitHub",
                                      isDark,
                                      onTap: () => _launch(PortfolioData.githubUrl),
                                    ),
                                    _headerLink(
                                      Icons.language_rounded,
                                      "portfolio-a62eb.web.app",
                                      isDark,
                                      onTap: () => _launch(PortfolioData.livePortfolioUrl),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Divider(),
                          const SizedBox(height: 18),

                          // 2. Professional Summary
                          _sectionTitle("PROFESSIONAL SUMMARY", isDark),
                          const SizedBox(height: 8),
                          Text(
                            "AI & Data Science student with hands-on experience in software development, mobile applications, backend development, REST APIs, databases, Firebase and data analytics. Co-Founder of ASK Tech Solutions with practical experience in project development and technical collaboration. Building expertise across AI/ML and Data Science while applying software engineering skills to real-world projects.",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 13.5,
                              height: 1.6,
                              color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                            ),
                          ),
                          const SizedBox(height: 22),

                          // 3. Education
                          _sectionTitle("EDUCATION", isDark),
                          const SizedBox(height: 8),
                          _twoColumnEntry(
                            title: "Sanjivani University, Kopargaon",
                            rightTag: "Currently Pursuing",
                            subtitle: "B.Tech. — Artificial Intelligence & Data Science",
                            isDark: isDark,
                          ),
                          const SizedBox(height: 22),

                          // 4. Experience
                          _sectionTitle("EXPERIENCE", isDark),
                          const SizedBox(height: 10),

                          _experienceEntry(
                            role: "Co-Founder & Software Engineer",
                            company: "ASK Tech Solutions",
                            period: "2026 – Present",
                            points: [
                              "Contribute to software product development, technical planning, project execution and team collaboration.",
                              "Work with Flutter, Go, MongoDB, Firebase, REST APIs, JWT authentication and Cloudinary across application projects.",
                              "Contribute to documentation, Git/GitHub workflows and development of practical technology solutions.",
                            ],
                            isDark: isDark,
                            theme: theme,
                          ),
                          const SizedBox(height: 16),

                          _experienceEntry(
                            role: "Data Analytics Intern",
                            company: "Oasis Infobyte",
                            period: "September 2026 – Present",
                            points: [
                              "Work on practical data analytics tasks involving data processing, exploratory analysis, visualization and interpretation.",
                              "Apply Python-based analytical workflows to identify patterns and communicate dataset insights.",
                            ],
                            isDark: isDark,
                            theme: theme,
                          ),
                          const SizedBox(height: 16),

                          _experienceEntry(
                            role: "Android / Flutter Developer",
                            company: "MHTECHIN",
                            period: "September 2025 – January 2026",
                            points: [
                              "Developed cross-platform mobile applications using Flutter and Dart.",
                              "Integrated Firebase services, REST APIs and JSON-based data exchange.",
                              "Used Git/GitHub for version control and collaborated on application development and debugging.",
                            ],
                            isDark: isDark,
                            theme: theme,
                          ),
                          const SizedBox(height: 22),

                          // 5. Technical Skills
                          _sectionTitle("TECHNICAL SKILLS", isDark),
                          const SizedBox(height: 10),
                          _skillRow("Languages", "Python, Dart, Go (Golang), SQL, JavaScript, Java", isDark),
                          _skillRow("AI / Data", "Data Analysis, EDA, Data Visualization, Machine Learning Fundamentals, Python for Data Science", isDark),
                          _skillRow("Development", "Flutter, Android Development, REST APIs, Backend Development, Firebase, JWT", isDark),
                          _skillRow("Databases", "MongoDB, Firebase Firestore, Firebase Realtime Database, SQL", isDark),
                          _skillRow("Tools", "Git, GitHub, VS Code, Android Studio, Postman, Jupyter Notebook, Figma, MongoDB Compass", isDark),
                          _skillRow("Engineering", "Clean Architecture, Layered Architecture, API Development, Authentication & Authorization, OOP, DSA Fundamentals", isDark),
                          const SizedBox(height: 22),

                          // 6. Projects
                          _sectionTitle("PROJECTS", isDark),
                          const SizedBox(height: 10),

                          _projectEntry(
                            name: "Blood Connect — Blood Donation Management System",
                            stack: "Flutter | Go | MongoDB | Firebase | Cloudinary | JWT | REST API",
                            points: [
                              "Built a blood donation platform connecting donors, blood requests and blood inventory.",
                              "Developed Flutter frontend and Go backend using clean/layered architecture with Router, Handler, Service, Repository and Models layers.",
                              "Implemented JWT authentication, role-based access control, donor availability, eligibility logic and MongoDB data management.",
                              "Integrated Cloudinary for profile media and Firebase services for OTP/notifications.",
                            ],
                            isDark: isDark,
                            theme: theme,
                          ),
                          const SizedBox(height: 16),

                          _projectEntry(
                            name: "AI-Powered Career & Skill Gap Analyzer",
                            stack: "Python | AI/ML | NLP | React | FastAPI | PostgreSQL",
                            points: [
                              "Designed an AI system to analyze resumes against job descriptions and extract relevant skills.",
                              "Planned semantic skill matching, skill-gap analysis and personalized learning-roadmap functionality.",
                            ],
                            isDark: isDark,
                            theme: theme,
                          ),
                          const SizedBox(height: 16),

                          _projectEntry(
                            name: "Inventory Demand Forecasting",
                            stack: "Python | Data Science | Machine Learning",
                            points: [
                              "Designed a machine-learning solution for analyzing historical sales and forecasting future product demand.",
                              "Focused on data preprocessing, trend analysis, visualization and forecasting workflows.",
                            ],
                            isDark: isDark,
                            theme: theme,
                          ),
                          const SizedBox(height: 22),

                          // 7. Leadership & Achievements
                          _sectionTitle("LEADERSHIP & ACHIEVEMENTS", isDark),
                          const SizedBox(height: 10),
                          _bulletPoint("Co-Founder of ASK Tech Solutions, contributing to technology development and project initiatives.", isDark),
                          _bulletPoint("Built a full-stack blood donation system covering frontend, backend, database, authentication, media and notification services.", isDark),
                          _bulletPoint("Hands-on experience across mobile development, backend development and data analytics, with current focus on AI/ML and Data Science.", isDark),
                          const SizedBox(height: 22),

                          // 8. Relevant Coursework & Target Roles
                          _sectionTitle("RELEVANT COURSEWORK", isDark),
                          const SizedBox(height: 8),
                          Text(
                            "Artificial Intelligence • Machine Learning • Data Science • Data Analytics • DBMS • SQL • OOP • Data Structures & Algorithms • Network & Information Security • Software Engineering",
                            style: TextStyle(
                              fontSize: 12.5,
                              height: 1.5,
                              color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                            ),
                          ),
                          const SizedBox(height: 20),

                          _sectionTitle("TARGET ROLES", isDark),
                          const SizedBox(height: 8),
                          Text(
                            "AI/ML Intern • Data Science Intern • Data Analyst Intern • Machine Learning Intern • Software Engineer Intern • Backend Developer Intern • AI Engineer Intern",
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
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

  static Widget _sectionTitle(String title, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
            color: isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 1.5,
          color: isDark ? const Color(0x3338BDF8) : const Color(0x330284C7),
        ),
      ],
    );
  }

  static Widget _twoColumnEntry({
    required String title,
    required String rightTag,
    required String subtitle,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              rightTag,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isDark ? const Color(0xFF34D399) : const Color(0xFF059669),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 13,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  static Widget _experienceEntry({
    required String role,
    required String company,
    required String period,
    required List<String> points,
    required bool isDark,
    required ThemeData theme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "$role — $company",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              period,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w600,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ...points.map((pt) => _bulletPoint(pt, isDark)),
      ],
    );
  }

  static Widget _projectEntry({
    required String name,
    required String stack,
    required List<String> points,
    required bool isDark,
    required ThemeData theme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          stack,
          style: const TextStyle(
            fontSize: 11.5,
            fontFamily: 'monospace',
            fontWeight: FontWeight.w700,
            color: Color(0xFF38BDF8),
          ),
        ),
        const SizedBox(height: 6),
        ...points.map((pt) => _bulletPoint(pt, isDark)),
      ],
    );
  }

  static Widget _bulletPoint(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.5,
                height: 1.5,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _skillRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 12.5,
            height: 1.5,
            color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
          ),
          children: [
            TextSpan(
              text: "$label: ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  static Widget _headerLink(
    dynamic icon,
    String label,
    bool isDark, {
    VoidCallback? onTap,
  }) {
    final widget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon is IconData
            ? Icon(icon, size: 12, color: AppTheme.primaryColor)
            : FaIcon(icon as FaIconData, size: 12, color: AppTheme.primaryColor),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: onTap != null
                ? (isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7))
                : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
          ),
        ),
      ],
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: widget,
      );
    }
    return widget;
  }

  static Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
