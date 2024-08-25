import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/main.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/ui/space_ui.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Expanded(
            child: navigationShell,
          ),
          CupertinoTabBar(
            onTap: (index) => _onTap(context, index),
            currentIndex: navigationShell.currentIndex,
            activeColor: settingsController.themeMode == Brightness.dark
                ? SpaceColors.white
                : SpaceColors.darkBlue,
            items: [
              BottomNavigationBarItem(
                icon: navigationShell.currentIndex == 0
                    ? const Icon(CupertinoIcons.house_fill)
                    : const Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: navigationShell.currentIndex == 1
                    ? const Icon(CupertinoIcons.rocket_fill)
                    : const Icon(CupertinoIcons.rocket),
                label: 'Iss',
              ),
              BottomNavigationBarItem(
                icon: navigationShell.currentIndex == 2
                    ? const Icon(CupertinoIcons.gear_alt_fill)
                    : const Icon(CupertinoIcons.gear),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: navigationShell.currentIndex == 3
                    ? const Icon(CupertinoIcons.person_fill)
                    : const Icon(CupertinoIcons.person),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    if (index == 3 &&
        !context.read<AuthenticationBloc>().state.status.isAuthenticated) {
      goRouter.pushNamed(AppRoute.loginView.name);
      return;
    }
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
