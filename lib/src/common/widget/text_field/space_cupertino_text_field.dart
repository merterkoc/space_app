import 'package:flutter/material.dart';
import 'package:space_app/app.dart';
import 'package:space_app/src/ui/space_ui.dart';
import 'package:space_app/src/util/extensions/theme_extension.dart';

class SpaceCupertinoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final EdgeInsets? padding;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autofocus;

  const SpaceCupertinoTextField({
    super.key,
    required this.controller,
    this.placeholder,
    this.padding,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      keyboardType: keyboardType,
      autofocus: autofocus,
      obscureText: obscureText,
      clearButtonMode: OverlayVisibilityMode.editing,
      suffix: !obscureText
          ? null
          : IconButton(
              onPressed: () {
                //controller.obscureText = !controller.obscureText;
              },
              icon: Icon(CupertinoIcons.eye_slash,
                  color: context.myThemeColors.smallButtonDisabledColor),
            ),
      prefix: icon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(
                icon,
                color: const Color(0xFFC4C4C4),
              ),
            )
          : null,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      controller: controller,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.systemGrey6,
          darkColor: CupertinoColors.darkBackgroundGray,
        ),
      ),
      placeholder: placeholder,
    );
  }
}
