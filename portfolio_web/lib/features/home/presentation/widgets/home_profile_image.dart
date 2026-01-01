import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import '../../../../shared/widgets/entrance_fader.dart';

class HomeProfileImage extends StatelessWidget {
  final Animation<double> animation;

  const HomeProfileImage({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -animation.value),
            child: child,
          );
        },
        child: EntranceFader(
          delay: const Duration(milliseconds: 200),
          offset: const Offset(0, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer Glow Ring 1 (Largest)
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeOut,
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value * 0.3,
                    child: Container(
                      width: 450 * value,
                      height: 450 * value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppTheme.primaryColor.withOpacity(0.3),
                            Colors.purpleAccent.withOpacity(0.2),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Outer Glow Ring 2 (Medium)
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOut,
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value * 0.4,
                    child: Container(
                      width: 400 * value,
                      height: 400 * value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.purpleAccent.withOpacity(0.25),
                            const Color(0xFFFF6B9D).withOpacity(0.15),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  );
                },
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

              // Rotating Gradient Ring
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 20),
                builder: (context, double value, child) {
                  return Transform.rotate(
                    angle: value * 2 * 3.14159,
                    child: Container(
                      width: 380,
                      height: 380,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.transparent),
                        gradient: SweepGradient(
                          colors: [
                            AppTheme.primaryColor.withOpacity(0.8),
                            Colors.transparent,
                            Colors.purpleAccent.withOpacity(0.8),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.25, 0.5, 0.75],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
