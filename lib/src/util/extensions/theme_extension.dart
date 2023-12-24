import 'package:flutter/cupertino.dart';
import 'package:space_app/src/ui/color/space_colors.dart';

extension MyThemeColorsExtension on BuildContext {
  MyThemeColors get myThemeColors => MyThemeColors.fromContext(this);
}

class MyThemeColors {
  final Color secondaryColor;
  final Color smallButtonActiveColor;
  final Color smallButtonDisabledColor;
  final Color smallButtonActiveTextColor;
  final Color smallButtonDisabledTextColor;
  final Color favoriteButtonActiveColor;
  final Color favoriteButtonDisabledColor;

  factory MyThemeColors.fromContext(BuildContext context) {
    return MyThemeColors(
        secondaryColor: const CupertinoDynamicColor.withBrightness(
          color: SpaceColors.violet,
          darkColor: SpaceColors.indigo,
        ).resolveFrom(context),
        smallButtonActiveColor: const CupertinoDynamicColor.withBrightness(
          color: SpaceColors.white,
          darkColor: SpaceColors.white,
        ).resolveFrom(context),
        smallButtonDisabledColor: const CupertinoDynamicColor.withBrightness(
          color: SpaceColors.darkBlue,
          darkColor: SpaceColors.violet,
        ).resolveFrom(context),
        smallButtonActiveTextColor: const CupertinoDynamicColor.withBrightness(
          color: SpaceColors.black,
          darkColor: SpaceColors.black,
        ).resolveFrom(context),
        smallButtonDisabledTextColor:
            const CupertinoDynamicColor.withBrightness(
              color: SpaceColors.white,
              darkColor: SpaceColors.white,
        ).resolveFrom(context),
        favoriteButtonActiveColor: const CupertinoDynamicColor.withBrightness(
          color: SpaceColors.white,
          darkColor: SpaceColors.white,
        ).resolveFrom(context),
        favoriteButtonDisabledColor:
            const CupertinoDynamicColor.withBrightness(
          color: SpaceColors.white,
          darkColor: SpaceColors.white,
        ).resolveFrom(context));
  }

  MyThemeColors({
    required this.secondaryColor,
    required this.smallButtonActiveColor,
    required this.smallButtonActiveTextColor,
    required this.smallButtonDisabledColor,
    required this.smallButtonDisabledTextColor,
    required this.favoriteButtonActiveColor,
    required this.favoriteButtonDisabledColor,
  });
}
