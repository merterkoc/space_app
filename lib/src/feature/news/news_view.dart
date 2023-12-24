import 'package:space_app/src/ui/space_ui.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Text('NewsView'),
        ),
      ),
    );
  }
}
