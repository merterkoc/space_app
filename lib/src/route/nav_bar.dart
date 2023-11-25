import 'package:go_router/go_router.dart';
import 'package:space_app/src/ui/space_ui.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(navigationShell.currentIndex == 0
                ? SpaceIcon.space.filledIcon
                : SpaceIcon.space),
            label: 'Event ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(navigationShell.currentIndex == 1
                ? SpaceIcon.event.filledIcon
                : SpaceIcon.event),
            label: 'Space',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(navigationShell.currentIndex == 2
                ? SpaceIcon.news.filledIcon
                : SpaceIcon.news),
            label: 'News',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
