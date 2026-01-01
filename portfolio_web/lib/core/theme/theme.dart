import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF64FFDA); // Teal/Cyan accent
  static const Color secondaryColor = Color(0xFF0A192F); // Dark Navy background
  static const Color cardColor = Color(0xFF112240); // Slightly lighter navy
  static const Color textColor = Color(0xFFCCD6F6); // Light Grey
  static const Color subTextColor = Color(0xFF8892B0); // Slate Grey

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: secondaryColor,
      cardColor: cardColor,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        bodyLarge: GoogleFonts.inter(fontSize: 16, color: subTextColor),
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: subTextColor),
      ),
      iconTheme: const IconThemeData(color: primaryColor),
    );
  }
}
