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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shadowColor: SpaceColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
      ),
      onPressed: () {
        if (isDisabled == true) return;
        onPressed();
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
