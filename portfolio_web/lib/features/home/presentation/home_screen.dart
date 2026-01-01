import 'package:flutter/material.dart';
import 'controllers/home_controller.dart';
import 'widgets/home_text_content.dart';
import 'widgets/home_profile_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleContactPress() {
    // TODO: Navigate to contact section or open contact dialog
    debugPrint('Contact button pressed');
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
            // Desktop Layout
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: HomeTextContent(
                    displayText: _controller.displayText,
                    textAlign: CrossAxisAlignment.start,
                    onContactPressed: _handleContactPress,
                  ),
                ),
                const SizedBox(width: 40),
                const Expanded(child: HomeProfileImage()),
              ],
            );
          } else {
            // Mobile Layout
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const HomeProfileImage(),
                const SizedBox(height: 40),
                HomeTextContent(
                  displayText: _controller.displayText,
                  textAlign: CrossAxisAlignment.center,
                  onContactPressed: _handleContactPress,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
