import 'package:flutter/material.dart';
import 'package:space_app/src/ui/space_ui.dart';
import 'package:space_app/src/util/extensions/theme_extension.dart';

class SmallButtonItem {
  late bool isActive;
  final String text;
  late VoidCallback callback;
  final IconData? icon;

  SmallButtonItem({
    required this.isActive,
    required this.text,
    required this.callback,
    this.icon,
  });
}

class SmallButton extends StatelessWidget {
  final SmallButtonItem smallButtonItems;

  const SmallButton({super.key, required this.smallButtonItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: smallButtonItems.isActive
            ? context.myThemeColors.smallButtonDisabledColor
            : context.myThemeColors.smallButtonActiveColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: CupertinoButton(
        onPressed: smallButtonItems.callback.call,
        borderRadius: BorderRadius.circular(8),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(smallButtonItems.text,
                style: TextStyle(
                    color: smallButtonItems.isActive
                        ? context.myThemeColors.smallButtonDisabledTextColor
                        : context.myThemeColors.smallButtonActiveTextColor,
                    fontSize: 16)),
            if (smallButtonItems.icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  smallButtonItems.icon,
                  size: 16,
                  color: smallButtonItems.isActive
                      ? context.myThemeColors.smallButtonDisabledTextColor
                      : context.myThemeColors.smallButtonActiveTextColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
