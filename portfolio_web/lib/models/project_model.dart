import 'package:flutter/material.dart';

class ProjectModel {
  final String id;
  final String title;
  final String tagline;
  final String category;
  final String description;
  final String problem;
  final String solution;
  final List<String> features;
  final List<String> architecture;
  final List<String> techStack;
  final List<String> challenges;
  final String outcome;
  final String? githubUrl;
  final String? liveUrl;
  final bool isFeatured;
  final Color primaryColor;
  final IconData icon;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.tagline,
    required this.category,
    required this.description,
    required this.problem,
    required this.solution,
    required this.features,
    required this.architecture,
    required this.techStack,
    required this.challenges,
    required this.outcome,
    this.githubUrl,
    this.liveUrl,
    this.isFeatured = false,
    this.primaryColor = const Color(0xFF38BDF8),
    this.icon = Icons.code,
  });
}
