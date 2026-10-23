import 'package:flutter/material.dart';

enum SkillCategory {
  programming,
  aiAndData,
  mobile,
  backend,
  tools,
}

class SkillModel {
  final String name;
  final dynamic icon; // IconData or FaIconData
  final Color color;
  final SkillCategory category;
  final String categoryName;
  final String level; // e.g. "Core", "Advanced", "Proficient", "Learning"

  const SkillModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.category,
    required this.categoryName,
    this.level = "Proficient",
  });
}
