import 'package:flutter/material.dart';
import 'widgets/hero_section.dart';
import 'widgets/quick_stats_bar.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onExploreWorkPressed;
  final VoidCallback? onContactPressed;

  const HomeScreen({
    super.key,
    this.onExploreWorkPressed,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeroSection(
          onExploreWorkPressed: onExploreWorkPressed,
          onContactPressed: onContactPressed,
        ),
        const SizedBox(height: 10),
        const QuickStatsBar(),
      ],
    );
  }
}
