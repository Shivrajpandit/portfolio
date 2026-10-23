import 'package:flutter/material.dart';

class JourneyModel {
  final String year;
  final String title;
  final String subtitle;
  final String description;
  final List<String> highlights;
  final dynamic icon;
  final Color accentColor;
  final String tag;

  const JourneyModel({
    required this.year,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.highlights,
    required this.icon,
    this.accentColor = const Color(0xFF38BDF8),
    required this.tag,
  });
}
