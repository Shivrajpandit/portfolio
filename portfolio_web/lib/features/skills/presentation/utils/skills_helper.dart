import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class SkillsHelper {
  static Color getIconColor(String name) {
    switch (name) {
      case 'Flutter':
        return Colors.blue;
      case 'Dart':
        return Colors.blueAccent;
      case 'Android':
        return Colors.green;
      case 'HTML / CSS':
        return Colors.orange;
      case 'Firebase':
        return Colors.amber;
      case 'MongoDB':
        return Colors.green;
      case 'Go':
        return Colors.lightBlue;
      case 'Figma':
        return Colors.purpleAccent;
      case 'C / C++':
        return Colors.blueGrey;
      case 'Git':
        return Colors.white;
      case 'Postman':
        return Colors.orangeAccent;
      default:
        return AppTheme.primaryColor;
    }
  }
}
