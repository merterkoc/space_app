import 'package:space_app/src/ui/space_ui.dart';

class CategoryTag extends StatelessWidget {
  final String category;

  const CategoryTag({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemRed.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        category,
        style: const TextStyle(
          fontSize: 12,
          color: CupertinoColors.white,
        ),
      ),
    );
  }
}
