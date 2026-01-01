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
          // Outer Glow Ring 1 (Largest) - Static
          Container(
            width: 450,
            height: 450,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppTheme.primaryColor.withOpacity(0.09),
                  Colors.purpleAccent.withOpacity(0.06),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Outer Glow Ring 2 (Medium) - Static
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.purpleAccent.withOpacity(0.1),
                  const Color(0xFFFF6B9D).withOpacity(0.06),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Main Profile Container with Enhanced Border
          Container(
            width: 350,
            height: 350,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  AppTheme.primaryColor,
                  Colors.purpleAccent,
                  Color(0xFFFF6B9D),
                  Colors.cyanAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.5),
                  blurRadius: 60,
                  spreadRadius: 15,
                ),
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.3),
                  blurRadius: 40,
                  spreadRadius: 8,
                ),
                BoxShadow(
                  color: const Color(0xFFFF6B9D).withOpacity(0.2),
                  blurRadius: 80,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
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
