import 'package:flutter/cupertino.dart';

mixin PaddingConst {
  static const _verySmall = 4.0;
  static const _small = 8.0;
  static const _medium = 16.0;
  static const _large = 24.0;
  static const _veryLarge = 32.0;
  static const _extraLarge = 48.0;

 static  EdgeInsets get verySmallPadding => const EdgeInsets.all(_verySmall);

  static EdgeInsets get smallPadding => const EdgeInsets.all(_small);

  static EdgeInsets get mediumPadding => const EdgeInsets.all(_medium);

  static EdgeInsets get largePadding => const EdgeInsets.all(_large);

  static EdgeInsets get veryLargePadding => const EdgeInsets.all(_veryLarge);

  static EdgeInsets get extraLargePadding => const EdgeInsets.all(_extraLarge);
}
