import 'package:space_app/src/ui/space_ui.dart';

class SpaceButton extends StatelessWidget {
  const SpaceButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading,
    this.isDisabled,
  });

  final Function onPressed;
  final String text;
  final bool? isLoading;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        if (isDisabled == true) return;
        onPressed();
      },
      child: Text(
        text,
        style: const TextStyle(color: SpaceColors.white, fontSize: 16),
        // style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
