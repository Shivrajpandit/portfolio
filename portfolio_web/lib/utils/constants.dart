import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'portfolio_data.dart';

class Constants {
  // Aliases from PortfolioData
  static const String name = PortfolioData.name;
  static const String role = PortfolioData.title;
  static const String email = PortfolioData.email;
  static const String githubUrl = PortfolioData.githubUrl;
  static const String linkedinUrl = PortfolioData.linkedinUrl;
  static const String resumeUrl = PortfolioData.resumeUrl;

  static const String aboutMe = PortfolioData.aboutDescription;

  static const List<String> aboutExperience = [
    "Junior Flutter Developer At MHTECHIN",
    "Android Developer Intern At MHTECHIN",
  ];

  static const List<String> education = [
    "B.Tech in Artificial Intelligence & Data Science - Sanjivani University, Kopargaon",
    "Polytechnic Diploma in Computer Science",
    "Certified Flutter Developer",
  ];

  static const List<Map<String, dynamic>> quickStats = PortfolioData.quickStats;
  static const List<Map<String, dynamic>> domainCards = PortfolioData.domainCards;
  static const List<Map<String, dynamic>> currentFocus = PortfolioData.currentFocus;
  static const List<Map<String, dynamic>> whatIBuild = PortfolioData.whatIBuild;
  static const List<Map<String, dynamic>> achievements = PortfolioData.achievements;
  static const List<Map<String, dynamic>> githubRepos = PortfolioData.githubRepos;

  static const List<Map<String, dynamic>> socialLinks = [
    {"icon": FontAwesomeIcons.github, "url": githubUrl, "name": "GitHub"},
    {"icon": FontAwesomeIcons.linkedin, "url": linkedinUrl, "name": "LinkedIn"},
    {"icon": Icons.email_rounded, "url": "mailto:$email", "name": "Email"},
  ];
}
