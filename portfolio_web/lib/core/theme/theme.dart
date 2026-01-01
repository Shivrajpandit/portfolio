import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Gradient Colors
  static const Color primaryColor = Color(0xFF64FFDA); // Cyan
  static const Color accentColor = Color(0xFFA5F3FF); // Light Blue
  static const Color purpleAccent = Color(0xFFBD34FE); // Purple
  static const Color pinkAccent = Color(0xFFFF6B9D); // Pink

  // Background Colors
  static const Color backgroundNavy = Color(0xFF0A192F);
  static const Color backgroundDeep = Color(0xFF020C1B);
  static const Color backgroundLight = Color(0xFF112240);
  static const Color cardColor = backgroundLight;

  // Text Colors
  static const Color textColor = Color(0xFFCCD6F6);
  static const Color subTextColor = Color(0xFF8892B0);
  static const Color white = Colors.white;

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundNavy,
      cardColor: backgroundLight,
      brightness: Brightness.dark,
      hintColor: subTextColor,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 80,
          fontWeight: FontWeight.w800,
          color: white,
          letterSpacing: -2.0,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: textColor,
          letterSpacing: -1.0,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: subTextColor,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          color: subTextColor,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          color: subTextColor,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.0,
          color: primaryColor,
        ),
      ),
      iconTheme: const IconThemeData(color: primaryColor, size: 24),
    );
  }
}
