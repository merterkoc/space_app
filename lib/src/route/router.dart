import 'package:go_router/go_router.dart';
import 'package:space_app/src/feature/home/event/event_view.dart';
import 'package:space_app/src/feature/home/home_view.dart';
import 'package:space_app/src/feature/news/news_view.dart';
import 'package:space_app/src/feature/permission/permission_view.dart';
import 'package:space_app/src/feature/settings/settings_view.dart';
import 'package:space_app/src/handlers/location_handler.dart';
import 'package:space_app/src/route/nav_bar.dart';
import 'package:space_app/src/route/sheel_route.dart';
import 'package:space_app/src/ui/space_ui.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

enum AppRoute {
  homeView(path: '/home'),
  permissionView(path: '/permissionView'),
  newsView(path: '/newsView'),
  settingsView(path: '/settingsView'),
  onBoardingView(path: '/onBoardingView'),
  eventDetailsView(path: 'eventDetailsView');

  const AppRoute({required this.path});

  final String path;

  String get location =>
      path.isNotEmpty && !path.startsWith('/') ? '/$path' : path;
}

final GoRouter goRouter = GoRouter(
    initialLocation: LocationHandler().position != null
        ? AppRoute.homeView.path
        : AppRoute.permissionView.path,
    navigatorKey: rootNavigatorKey,
    routes: <RouteBase>[
      ShellRoute(
        observers: [routeObserver],
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ShellView(child: child);
        },
        routes: [
          GoRoute(
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
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoute.homeView.path,
                    name: AppRoute.homeView.name,
                    builder: (BuildContext context, GoRouterState state) =>
                        const HomeView(),
                    routes: <RouteBase>[
                      GoRoute(
                        path: AppRoute.eventDetailsView.path,
                        name: AppRoute.eventDetailsView.name,
                        builder: (BuildContext context, GoRouterState state) {
                          return const EventDetailView();
                        },
                      ),
                    ],
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
      )
    ]);
