import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';
import 'section_badge.dart';

class SectionHeader extends StatelessWidget {
  final String badgeText;
  final String title;
  final String? subtitle;
  final dynamic badgeIcon;
  final Color? accentColor;
  final bool isCentered;

  const SectionHeader({
    super.key,
    required this.badgeText,
    required this.title,
    this.subtitle,
    this.badgeIcon,
    this.accentColor,
    this.isCentered = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = accentColor ?? AppTheme.primaryColor;

    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        SectionBadge(
          label: badgeText,
          icon: badgeIcon,
          color: accent,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Text(
              subtitle!,
              textAlign: isCentered ? TextAlign.center : TextAlign.start,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: theme.textTheme.bodyLarge?.color?.withValues(alpha: 0.85),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
