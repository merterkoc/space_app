import 'package:go_router/go_router.dart';
import 'package:space_app/src/feature/home/home_view.dart';
import 'package:space_app/src/feature/news/news_view.dart';
import 'package:space_app/src/feature/settings/settings_view.dart';
import 'package:space_app/src/route/nav_bar.dart';
import 'package:space_app/src/ui/space_ui.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  homeView(path: '/'),
  newsView(path: '/newsView'),
  settingsView(path: '/settingsView'),
  onBoardingView(path: '/onBoardingView');

  const AppRoute({required this.path});

  final String path;

  String get location =>
      path.isNotEmpty && !path.startsWith('/') ? '/$path' : path;
}

final GoRouter goRouter = GoRouter(
  initialLocation: AppRoute.homeView.path,
  navigatorKey: rootNavigatorKey,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.homeView.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeView(),
              routes: const <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.settingsView.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const SettingsView(),
              routes: const <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.newsView.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const NewsView(),
              routes: const <RouteBase>[],
            ),
          ],
        ),
      ],
    ),
  ],
);
