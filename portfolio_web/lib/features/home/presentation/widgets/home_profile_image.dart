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
          child: Container(
            width: 350,
            height: 350,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [AppTheme.primaryColor, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.4),
                  blurRadius: 50,
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: 5,
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
        ),
      ),
    );
  }
}
