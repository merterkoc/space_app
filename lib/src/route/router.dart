import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/src/feature/home/event/event_detail_view.dart';
import 'package:space_app/src/feature/home/home_view.dart';
import 'package:space_app/src/feature/news/news_view.dart';
import 'package:space_app/src/feature/permission/permission_view.dart';
import 'package:space_app/src/feature/settings/settings_view.dart';
import 'package:space_app/src/handlers/location_handler.dart';
import 'package:space_app/src/route/nav_bar.dart';
import 'package:space_app/src/ui/space_ui.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorSettings =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

enum AppRoute {
  homeView(path: '/home'),
  permissionView(path: '/permissionView'),
  newsView(path: '/newsView'),
  settingsView(path: '/settingsView'),
  onBoardingView(path: '/onBoardingView'),
  eventDetailsView(path: 'eventDetailsView/:id');

  const AppRoute({required this.path});

  final String path;

  String get location =>
      path.isNotEmpty && !path.startsWith('/') ? '/$path' : path;
}

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: LocationHandler().position != null
      ? AppRoute.homeView.path
      : AppRoute.permissionView.path,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.permissionView.path,
      name: AppRoute.permissionView.name,
      builder: (BuildContext context, GoRouterState state) =>
          const PermissionView(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome,
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.homeView.path,
              name: AppRoute.homeView.name,
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CupertinoPage<void>(
                key: state.pageKey,
                child: const HomeView(),
              ),
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoute.eventDetailsView.path,
                  name: AppRoute.eventDetailsView.name,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final id = state.pathParameters['id'];
                    return CupertinoPage<void>(
                      key: state.pageKey,
                      child: EventDetailView(id: id),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettings,
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.settingsView.path,
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CupertinoPage<void>(
                key: state.pageKey,
                child: const SettingsView(),
              ),
              routes: const <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.newsView.path,
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CupertinoPage<void>(
                key: state.pageKey,
                child: const NewsView(),
              ),
              routes: const <RouteBase>[],
            ),
          ],
        ),
      ],
    ),
  ],
);
