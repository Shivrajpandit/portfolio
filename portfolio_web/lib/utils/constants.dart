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
      "https://www.linkedin.com/in/shivraj-pandit-9ab2a12a2/";

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
      "title": "Ecommerce App",
      "description":
          "A modern and responsive e-commerce mobile application built with Flutter. This app provides users with a smooth shopping experience — from product browsing to checkout — all in a beautifully designed interface.",
      "github": "https://github.com/Shivrajpandit/ecommarce-app",
      "category": "Mobile App",
      "status": "Completed",
      "tags": ["Flutter", "Dart", "UI/UX", "Shopping"],
      "color": Color(0xFF2D1B3E), // Purple tone
      "iconColor": Color(0xFFA855F7),
    },
    {
      "title": "Foody Website",
      "description":
          "A comprehensive food delivery website offering a vast variety of cuisines and a seamless ordering experience.",
      "github": "https://github.com/Shivrajpandit/websites",
      "liveUrl":
          "https://foody2-imhoj27pp-shivrajs-projects-e54e56f1.vercel.app",
      "isLive": true,
      "category": "Web App",
      "status": "Completed",
      "tags": ["React", "CSS", "Vercel", "Food Delivery"],
      "color": Color(0xFF3E1B1B), // Dark Red tone
      "iconColor": Color(0xFFF87171),
    },
    {
      "title": "Portfolio Website",
      "description":
          "A sleek and professional portfolio website showcasing my skills, projects, and professional journey with smooth animations and responsive design.",
      "github": "https://github.com/Shivrajpandit/portfolio",
      "category": "Website",
      "status": "Completed",
      "tags": ["Flutter Web", "Responsive Design", "Animations"],
      "color": Color(0xFF1A2F2A), // Green tone
      "iconColor": Color(0xFF10B981),
    },
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
  ];

  static const List<Map<String, dynamic>> experiences = [
    {
      "role": "Junior Flutter Developer",
      "company": "MHTECHIN",
      "period": "Sept 2025 - Present",
      "description":
          "Developing cross-platform mobile applications using Flutter. Collaborating with the design and backend teams to deliver high-quality products.",
      "color": Color(0xFF64FFDA), // Cyan
    },
    {
      "role": "Android Developer",
      "company": "Internship + Full-Time",
      "period": "June - Aug",
      "description":
          "Worked on native Android development using Flutter/Dart. Assisted in bug fixing and feature implementation.",
      "color": Color(0xFF64FFDA), // Cyan
    },
  ];

  static const List<Map<String, dynamic>> socialLinks = [
    {"icon": FontAwesomeIcons.github, "url": githubUrl},
    {"icon": FontAwesomeIcons.linkedin, "url": linkedinUrl},
    {"icon": Icons.email, "url": "mailto:$email"},
  ];
}
