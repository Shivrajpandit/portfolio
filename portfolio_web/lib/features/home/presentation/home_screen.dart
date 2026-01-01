import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/entrance_fader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String _displayText = "";
  final String _targetText = "Flutter Developer | Software Engineer";
  int _index = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _startTyping();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTyping() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;

      Future.doWhile(() async {
        if (!mounted) return false;
        await Future.delayed(const Duration(milliseconds: 100));
        if (!mounted) return false;

        setState(() {
          if (_index < _targetText.length) {
            _displayText += _targetText[_index];
            _index++;
          }
        });
        return _index < _targetText.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildTextContent(
                    context,
                    textAlign: CrossAxisAlignment.start,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(child: _buildProfileImage()),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                _buildProfileImage(),
                const SizedBox(height: 40),
                _buildTextContent(
                  context,
                  textAlign: CrossAxisAlignment.center,
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildTextContent(
    BuildContext context, {
    required CrossAxisAlignment textAlign,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      decoration: BoxDecoration(
        // refined, minimal glass
        color: const Color(0xFF112240).withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: textAlign,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.code, color: AppTheme.primaryColor, size: 24),
              const SizedBox(width: 10),
              Text(
                "HELLO THERE, I AM",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3.0,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Massive Typography
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFF64FFDA), // Bright Teal
                Color(0xFF00BFA5), // Darker Teal
                Colors.purpleAccent,
                Colors.deepPurple,
              ],
              stops: [0.0, 0.3, 0.7, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              Constants.name.toUpperCase(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 90, // Massive
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 0.9, // Tight letter spacing
                letterSpacing: -2.0,
              ),
              textAlign: textAlign == CrossAxisAlignment.center
                  ? TextAlign.center
                  : TextAlign.start,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _displayText,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: const Color(0xFFCCD6F6),
              fontWeight: FontWeight.w500,
              fontSize: 28,
              height: 1.2,
              letterSpacing: 1.2,
            ),
            textAlign: textAlign == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
          ),
          const SizedBox(height: 40),

          // Use Wrap for buttons/socials to handle smaller screens gracefully
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 30,
            runSpacing: 20,
            alignment: textAlign == CrossAxisAlignment.center
                ? WrapAlignment.center
                : WrapAlignment.start,
            children: [
              // Premium Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Pill shape
                  gradient: const LinearGradient(
                    colors: [AppTheme.primaryColor, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    "CONTACT ME",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),

              // Minimal Social Icons Row
              Row(
                mainAxisSize: MainAxisSize.min,
                children: Constants.socialLinks.map((social) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      padding: const EdgeInsets.all(2), // Gradient border width
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0A192F), // Inner bg
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            social['icon'],
                            size: 20,
                            color: Colors.white70,
                          ),
                          hoverColor: AppTheme.primaryColor.withOpacity(0.1),
                          splashRadius: 24,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -_animation.value), // Levitation
            child: child,
          );
        },
        child: EntranceFader(
          delay: const Duration(milliseconds: 200),
          offset: const Offset(0, 0),
          child: Container(
            width: 350,
            height: 350,
            padding: const EdgeInsets.all(5), // Border width
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // Gradient Border
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
