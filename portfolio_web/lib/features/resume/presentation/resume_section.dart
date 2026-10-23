import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/portfolio_data.dart';
import '../../../shared/widgets/section_badge.dart';
import '../../../shared/widgets/hover_lift_card.dart';
import '../../../shared/widgets/fade_in_animation.dart';

import '../../../shared/widgets/resume_viewer_modal.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 60 : (width > 600 ? 32 : 20),
        vertical: 60,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: FadeInAnimation(
          delay: const Duration(milliseconds: 100),
          child: HoverLiftCard(
            liftAmount: -6,
            child: Container(
              padding: EdgeInsets.all(isDesktop ? 48 : 28),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          const Color(0xFF0F172A),
                          const Color(0xFF131D36),
                          const Color(0xFF0B172E),
                        ]
                      : [
                          Colors.white,
                          const Color(0xFFF1F5F9),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: AppTheme.primaryColor.withValues(alpha: 0.35),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: isDark ? 0.12 : 0.05),
                    blurRadius: 40,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: isDesktop
                  ? Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: _buildResumeText(theme, isDark),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 5,
                          child: _buildResumeActions(context, isDark),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildResumeText(theme, isDark),
                        const SizedBox(height: 28),
                        _buildResumeActions(context, isDark),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResumeText(ThemeData theme, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionBadge(
          label: "Curriculum Vitae",
          icon: Icons.description_rounded,
          color: AppTheme.primaryColor,
        ),
        const SizedBox(height: 16),
        Text(
          "Want to explore my full qualifications?",
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Review my complete technical background, academic coursework in AI & Data Science, software projects, and industry developer experience.",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            height: 1.6,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
          ),
        ),
      ],
    );
  }

  Widget _buildResumeActions(BuildContext context, bool isDark) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        ElevatedButton.icon(
          onPressed: () => ResumeViewerModal.show(context),
          icon: const Icon(Icons.visibility_rounded, size: 18),
          label: const Text("View Resume"),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () => _launch(PortfolioData.linkedinUrl),
          icon: const FaIcon(FontAwesomeIcons.linkedin, size: 16),
          label: const Text("Connect on LinkedIn"),
          style: OutlinedButton.styleFrom(
            foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 16,
            ),
            side: BorderSide(
              color: isDark ? const Color(0x3338BDF8) : const Color(0x330284C7),
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
