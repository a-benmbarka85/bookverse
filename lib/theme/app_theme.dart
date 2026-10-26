import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _buildTheme(Brightness.light);
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isLight = brightness == Brightness.light;
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
      brightness: brightness,
    );

    final TextTheme baseTextTheme = isLight
        ? GoogleFonts.interTextTheme(ThemeData.light().textTheme)
        : GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
            bodyColor: colorScheme.onSurface,
            displayColor: colorScheme.onSurface,
          );

    final TextTheme textTheme = baseTextTheme.copyWith(
      titleLarge: GoogleFonts.lora(
        textStyle: baseTextTheme.titleLarge,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      titleMedium: GoogleFonts.lora(
        textStyle: baseTextTheme.titleMedium,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
    );

    final double borderOpacity = isLight ? 0.5 : 0.2;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: GoogleFonts.lora(
          textStyle: textTheme.titleLarge,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: borderOpacity),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: textTheme.labelLarge,
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
    );
  }
}
