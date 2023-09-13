import 'package:flutter/material.dart';
import 'package:space_app/src/ui/color/space_colors.dart';

class SpaceTextTheme {
  TextTheme get lightTextTheme => const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        displayLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 68,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: SpaceColors.black,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 44,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 32,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: SpaceColors.black,
        ),
        titleSmall: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: SpaceColors.black),
      );

  TextTheme get darkTextTheme => TextTheme(
        bodyLarge: lightTextTheme.bodyLarge?.copyWith(color: Colors.white),
        bodyMedium: lightTextTheme.bodyMedium?.copyWith(color: Colors.white),
        bodySmall: lightTextTheme.bodySmall?.copyWith(color: Colors.white),
        headlineLarge:
            lightTextTheme.headlineLarge?.copyWith(color: Colors.white),
        headlineMedium:
            lightTextTheme.headlineMedium?.copyWith(color: Colors.white),
        headlineSmall:
            lightTextTheme.headlineSmall?.copyWith(color: Colors.white),
        displayLarge:
            lightTextTheme.displayLarge?.copyWith(color: Colors.white),
        displayMedium:
            lightTextTheme.displayMedium?.copyWith(color: Colors.white),
        displaySmall:
            lightTextTheme.displaySmall?.copyWith(color: Colors.white),
        labelLarge: lightTextTheme.labelLarge?.copyWith(color: Colors.white),
        labelMedium: lightTextTheme.labelMedium?.copyWith(color: Colors.white),
        labelSmall: lightTextTheme.labelSmall?.copyWith(color: Colors.white),
        titleLarge: lightTextTheme.titleLarge?.copyWith(color: Colors.white),
        titleMedium: lightTextTheme.titleMedium?.copyWith(color: Colors.white),
        titleSmall: lightTextTheme.titleSmall?.copyWith(color: Colors.white),
      );
}
