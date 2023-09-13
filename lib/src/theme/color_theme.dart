import 'package:flutter/material.dart';
import 'package:space_app/src/ui/color/space_colors.dart';

mixin CustomColorScheme {
  static ColorScheme light() {
    return const ColorScheme.light(
      brightness: Brightness.light,
      primary: SpaceColors.purple, // Bu icon rengidir
      onPrimary: SpaceColors.white,
      primaryContainer: SpaceColors.black,
      onPrimaryContainer: SpaceColors.black,
      secondary: SpaceColors.pink,
      onSecondary: SpaceColors.white,
      secondaryContainer: SpaceColors.black,
      onSecondaryContainer: SpaceColors.black,
      tertiary: SpaceColors.black,
      onTertiary: SpaceColors.black,
      tertiaryContainer: SpaceColors.black,
      onTertiaryContainer: SpaceColors.black,
      error: SpaceColors.black,
      onError: SpaceColors.white,
      errorContainer: SpaceColors.black,
      onErrorContainer: SpaceColors.black,
      background: SpaceColors.white,
      onBackground: SpaceColors.black,
      surface: SpaceColors.white,
      onSurface: SpaceColors.black,
      surfaceVariant: SpaceColors.black,
      onSurfaceVariant: SpaceColors.black,
      outline: SpaceColors.black,
      outlineVariant: SpaceColors.black,
      shadow: SpaceColors.black,
      scrim: SpaceColors.black,
      inverseSurface: SpaceColors.black,
      onInverseSurface: SpaceColors.black,
      inversePrimary: SpaceColors.black,
      surfaceTint: SpaceColors.black,
    );
  }

  static ColorScheme dark() {
    return const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: SpaceColors.black,
      onPrimary: SpaceColors.black,
      primaryContainer: SpaceColors.white,
      onPrimaryContainer: SpaceColors.white,
      secondary: SpaceColors.purple,
      onSecondary: SpaceColors.white,
      secondaryContainer: SpaceColors.black,
      onSecondaryContainer: SpaceColors.black,
      tertiary: SpaceColors.black,
      onTertiary: SpaceColors.black,
      tertiaryContainer: SpaceColors.black,
      onTertiaryContainer: SpaceColors.black,
      error: SpaceColors.black,
      onError: SpaceColors.black,
      errorContainer: SpaceColors.black,
      onErrorContainer: SpaceColors.black,
      background: SpaceColors.black,
      onBackground: SpaceColors.black,
      surface: SpaceColors.black,
      onSurface: SpaceColors.white,
      surfaceVariant: SpaceColors.black,
      onSurfaceVariant: SpaceColors.white,
      outline: SpaceColors.white,
      outlineVariant: SpaceColors.white,
      shadow: SpaceColors.white,
      scrim: SpaceColors.white,
      inverseSurface: SpaceColors.white,
      onInverseSurface: SpaceColors.white,
      inversePrimary: SpaceColors.black,
      surfaceTint: SpaceColors.black,
    );
  }
}
