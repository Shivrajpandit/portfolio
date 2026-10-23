import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Accents
  static const Color primaryColor = Color(0xFF38BDF8); // Electric Sky
  static const Color cyanAccent = Color(0xFF64FFDA); // Teal/Cyan
  static const Color indigoAccent = Color(0xFF818CF8); // Electric Indigo
  static const Color purpleAccent = Color(0xFFA855F7); // Neon Violet
  static const Color emeraldAccent = Color(0xFF34D399); // Emerald Mint
  static const Color coralAccent = Color(0xFFF43F5E); // Coral Red
  static const Color amberAccent = Color(0xFFFBBF24); // Amber Gold
  static const Color pinkAccent = Color(0xFFEC4899); // Neon Pink
  static const Color accentColor = Color(0xFFA5F3FF); // Soft Ice Cyan

  // Dark Theme Palette
  static const Color darkBackground = Color(0xFF060913);
  static const Color darkBackground2 = Color(0xFF0B1120);
  static const Color darkSurface = Color(0xFF0F172A);
  static const Color darkCard = Color(0xFF131D36);
  static const Color darkBorder = Color(0x1F38BDF8);
  static const Color darkBorderSubtle = Color(0x14FFFFFF);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkTextMuted = Color(0xFF64748B);

  // Light Theme Palette
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightBackground2 = Color(0xFFF1F5F9);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0x1F0284C7);
  static const Color lightBorderSubtle = Color(0x140F172A);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);
  static const Color lightTextMuted = Color(0xFF94A3B8);

  // Backward compatibility aliases
  static const Color backgroundNavy = darkBackground2;
  static const Color backgroundDeep = darkBackground;
  static const Color backgroundLight = darkCard;
  static const Color cardColor = darkCard;
  static const Color textColor = darkTextPrimary;
  static const Color subTextColor = darkTextSecondary;
  static const Color white = Colors.white;

  // Glassmorphic Decoration helper
  static BoxDecoration glassCardDecoration({
    required BuildContext context,
    bool isHovered = false,
    Color? customColor,
    Color? borderColor,
    double borderRadius = 20,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = customColor ??
        (isDark
            ? darkCard.withValues(alpha: isHovered ? 0.90 : 0.65)
            : lightSurface.withValues(alpha: isHovered ? 0.95 : 0.85));

    final effectiveBorder = borderColor ??
        (isHovered
            ? primaryColor.withValues(alpha: 0.5)
            : (isDark ? darkBorder : lightBorder));

    return BoxDecoration(
      color: baseColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: effectiveBorder,
        width: isHovered ? 1.5 : 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: isHovered
              ? primaryColor.withValues(alpha: isDark ? 0.15 : 0.08)
              : Colors.black.withValues(alpha: isDark ? 0.25 : 0.04),
          blurRadius: isHovered ? 30 : 15,
          offset: Offset(0, isHovered ? 10 : 4),
          spreadRadius: isHovered ? 1 : 0,
        ),
      ],
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackground,
      canvasColor: darkBackground2,
      cardColor: darkCard,
      dividerColor: darkBorderSubtle,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: cyanAccent,
        tertiary: indigoAccent,
        surface: darkSurface,
        onPrimary: darkBackground,
        onSecondary: darkBackground,
        onSurface: darkTextPrimary,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 64,
          fontWeight: FontWeight.w800,
          color: darkTextPrimary,
          letterSpacing: -1.5,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          fontSize: 44,
          fontWeight: FontWeight.w700,
          color: darkTextPrimary,
          letterSpacing: -1.0,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: darkTextPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: darkTextPrimary,
        ),
        headlineSmall: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: darkTextPrimary,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: darkTextPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: darkTextSecondary,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: darkTextSecondary,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.jetBrainsMono(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: primaryColor,
        ),
      ),
      iconTheme: const IconThemeData(color: primaryColor, size: 22),
    );
  }

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color(0xFF0284C7),
      scaffoldBackgroundColor: lightBackground,
      canvasColor: lightBackground2,
      cardColor: lightCard,
      dividerColor: lightBorderSubtle,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0284C7),
        secondary: Color(0xFF0D9488),
        tertiary: Color(0xFF6366F1),
        surface: lightSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: lightTextPrimary,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 64,
          fontWeight: FontWeight.w800,
          color: lightTextPrimary,
          letterSpacing: -1.5,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          fontSize: 44,
          fontWeight: FontWeight.w700,
          color: lightTextPrimary,
          letterSpacing: -1.0,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: lightTextPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: lightTextPrimary,
        ),
        headlineSmall: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: lightTextPrimary,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: lightTextPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: lightTextSecondary,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: lightTextSecondary,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.jetBrainsMono(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: const Color(0xFF0284C7),
        ),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF0284C7), size: 22),
    );
  }
}
