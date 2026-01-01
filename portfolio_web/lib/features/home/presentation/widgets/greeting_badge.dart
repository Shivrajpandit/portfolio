import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class GreetingBadge extends StatelessWidget {
  const GreetingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
