import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Constants {
  // Strings
  static const String name =
      "Shivraj Pandit"; // Replace with actual name if known, using username for now
  static const String role = "Flutter Developer | Software Engineer";
  static const String email = "panditshivraj934@gmail.com";
  static const String githubUrl = "https://github.com/Shivrajpandit";
  static const String linkedinUrl =
      "https://linkedin.com/in/yourprofile"; // Replace with actual if known

  static const String aboutMe =
      "I'm a Junior Flutter Developer focused on building smooth, high-performance mobile apps. Skilled in\nDart, Flutter, UI/UX, API integration, and REST architecture.\n\nI convert ideas into scalable, user-friendly applications. Currently learning State Management,\nBackend Connectivity, and Golang. My goal is to create meaningful projects that provide real value to\nusers.";

  static const List<String> aboutExperience = [
    "Junior Flutter Developer At MHTECHIN",
    "Android Developer Intern At MHTECHIN",
  ];

  static const List<String> education = [
    "Polytechnic Diploma in Computer Science",
    "Certified Flutter Developer",
  ];

  // Skills
  // Skills
  static const List<Map<String, dynamic>> skillItems = [
    {"name": "Flutter", "icon": FontAwesomeIcons.flutter}, // Flutter
    {
      "name": "Dart",
      "icon": Icons.gps_fixed,
    }, // Dart (Using a placeholder or FA if available, generic target icon often used or simplified) - Actually FontAwesome doesn't have Dart always. Let's use logic in UI or standard Icons.
    {"name": "Android", "icon": FontAwesomeIcons.android},
    {"name": "C / C++", "icon": FontAwesomeIcons.c}, // or generic code
    {"name": "HTML / CSS", "icon": FontAwesomeIcons.html5},
    {"name": "Firebase", "icon": FontAwesomeIcons.fire},
    {"name": "MongoDB", "icon": FontAwesomeIcons.database},
    {"name": "Go", "icon": FontAwesomeIcons.golang},
    {
      "name": "Postman",
      "icon": FontAwesomeIcons.paperPlane,
    }, // closely resembles request
    {"name": "Git", "icon": FontAwesomeIcons.github}, // or git
    {"name": "Figma", "icon": FontAwesomeIcons.figma},
  ];

  // Projects (Placeholder Data)
  // Projects
  static const List<Map<String, dynamic>> projects = [
    {
      "title": "BloodConnect",
      "description":
          "A platform connecting blood donors with those in need during emergencies.",
      "github": "https://github.com/Shivrajpandit/BloodConnect",
      "category": "Personal Projects",
      "status": "Pending",
      "tags": ["Flutter", "Firebase", "Google Maps"],
      "color": Color(0xFF3B1B1B), // Red tone
      "iconColor": Color(0xFFEF4444),
    },
    {
      "title": "Online Classes",
      "description": "An educational platform for teachers and students.",
      "github": "https://github.com/Shivrajpandit/OnlineClasses",
      "category": "Personal Projects",
      "status": "Completed",
      "tags": ["Flutter", "Node.js", "MongoDB"],
      "color": Color(0xFF1B263B), // Blue tone
      "iconColor": Color(0xFF3B82F6),
    },
    {
      "title": "Portfolio Website",
      "description":
          "Personal portfolio website showcasing skills, projects, and experience.",
      "github": "https://github.com/Shivrajpandit/Portfolio",
      "category": "Website",
      "status": "Completed",
      "tags": ["Flutter Web", "Responsive Design", "Firebase"],
      "color": Color(0xFF1A2F2A), // Green tone
      "iconColor": Color(0xFF10B981),
    },
  ];

  static const List<Map<String, dynamic>> experiences = [
    {
      "role": "Junior Flutter Developer",
      "company": "MHTECHIN",
      "period": "Sept 2024 - Present",
      "description":
          "Developing cross-platform mobile applications using Flutter. Collaborating with the design and backend teams to deliver high-quality products.",
      "color": Color(0xFF64FFDA), // Cyan
    },
    {
      "role": "Android Developer",
      "company": "Internship + Full-Time",
      "period": "June - Aug",
      "description":
          "Worked on native Android development using Kotlin/Java. Assisted in bug fixing and feature implementation.",
      "color": Color(0xFF64FFDA), // Cyan
    },
  ];

  static const List<Map<String, dynamic>> socialLinks = [
    {"icon": FontAwesomeIcons.github, "url": githubUrl},
    {"icon": FontAwesomeIcons.linkedin, "url": linkedinUrl},
    {"icon": Icons.email, "url": "mailto:$email"},
  ];
}
