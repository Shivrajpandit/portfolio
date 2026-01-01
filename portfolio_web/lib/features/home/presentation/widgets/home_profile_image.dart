import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class HomeProfileImage extends StatelessWidget {
  const HomeProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow Ring (Large)
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppTheme.primaryColor.withOpacity(0.08),
                  AppTheme.purpleAccent.withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Secondary Glow Ring
          Container(
            width: 420,
            height: 420,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppTheme.purpleAccent.withOpacity(0.12),
                  const Color(0xFFFF6B9D).withOpacity(0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Outer Border Ring
          Container(
            width: 385,
            height: 385,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),

          // Main Profile Container with Gradient Border
          Container(
            width: 360,
            height: 360,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  AppTheme.primaryColor,
                  AppTheme.purpleAccent,
                  AppTheme.pinkAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.4),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),
                BoxShadow(
                  color: AppTheme.purpleAccent.withOpacity(0.3),
                  blurRadius: 60,
                  spreadRadius: -10,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.backgroundNavy, width: 5),
                image: const DecorationImage(
                  image: AssetImage("assets/images/user_profile.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
