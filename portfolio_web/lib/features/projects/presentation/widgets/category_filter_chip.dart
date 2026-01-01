import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class CategoryFilterChip extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryFilterChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : AppTheme.cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppTheme.primaryColor
                : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.black : AppTheme.subTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
