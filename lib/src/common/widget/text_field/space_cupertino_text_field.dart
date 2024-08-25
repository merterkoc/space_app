import 'package:space_app/src/ui/space_ui.dart';

class SpaceCupertinoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final EdgeInsets? padding;
  final IconData? icon;

  const SpaceCupertinoTextField({
    super.key,
    required this.controller,
    this.placeholder,
    this.padding,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      clearButtonMode: OverlayVisibilityMode.editing,
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
