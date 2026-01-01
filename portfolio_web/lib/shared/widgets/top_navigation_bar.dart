import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../utils/constants.dart';

class TopNavigationBar extends StatelessWidget {
  final Function(String)? onNavClick;
  const TopNavigationBar({super.key, this.onNavClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Handled by blur container now
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Home Link
          InkWell(
            onTap: () => _handleNavClick(context, 'home'),
            child: Text(
              Constants.name,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppTheme.primaryColor,
                fontSize: 24,
              ),
            ),
          ),

          // Desktop Links
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _navItem(context, 'Home', 'home'),
                _navItem(context, 'About', 'about'),
                _navItem(context, 'Skills', 'skills'),
                _navItem(context, 'Experience', 'experience'),
                _navItem(context, 'Projects', 'projects'),
                _navItem(context, 'Contact', 'contact'),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.primaryColor),
              onPressed: () {
                // Mobile Menu (Not implemented in this step, but placeholder)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Mobile Menu to be implemented"),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, String section) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () => _handleNavClick(context, section),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _handleNavClick(BuildContext context, String section) {
    if (onNavClick != null) {
      onNavClick!(section);
    } else {
      // Fallback or ignore for now if purely SPA
      // context.go('/$section');
    }
  }
}
