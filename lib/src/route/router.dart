import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/feature/home/event/event_detail_view.dart';
import 'package:space_app/src/feature/home/home_view.dart';
import 'package:space_app/src/feature/home/more_event/more_event_view.dart';
import 'package:space_app/src/feature/iss/bloc/iss_bloc.dart';
import 'package:space_app/src/feature/iss/iss_view.dart';
import 'package:space_app/src/feature/login/login_view.dart';
import 'package:space_app/src/feature/permission/permission_view.dart';
import 'package:space_app/src/feature/profile/profile_view.dart';
import 'package:space_app/src/feature/settings/settings_view.dart';
import 'package:space_app/src/handlers/location_handler.dart';
import 'package:space_app/src/route/nav_bar.dart';
import 'package:space_app/src/route/sheel_route.dart';
import 'package:space_app/src/ui/space_ui.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHome = GlobalKey<NavigatorState>();
final _shellNavigatorSettings =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

enum AppRoute {
  homeView(path: '/home'),
  permissionView(path: '/permissionView'),
  loginView(path: '/loginView'),
  profileView(path: '/profileView'),
  settingsView(path: '/settingsView'),
  onBoardingView(path: '/onBoardingView'),
  issView(path: '/issView'),
  eventDetailsView(path: "eventDetailsView/:id/:imageHeroTag"),
  moreEventsView(path: 'moreEventsView');

  const AppRoute({required this.path});

  final String path;

  String get location =>
      path.isNotEmpty && !path.startsWith('/') ? '/$path' : path;
}

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: LocationHandler().position != null
      ? AppRoute.homeView.path
      : AppRoute.permissionView.path,
  routes: <RouteBase>[
    ShellRoute(
        builder: (context, state, child) {
          return ShellView(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoute.permissionView.path,
            name: AppRoute.permissionView.name,
            builder: (BuildContext context, GoRouterState state) =>
                const PermissionView(),
          ),
          GoRoute(
            path: AppRoute.loginView.path,
            name: AppRoute.loginView.name,
            builder: (BuildContext context, GoRouterState state) =>
                const LoginView(),
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
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        CupertinoPage<void>(
                      key: state.pageKey,
                      child: const HomeView(),
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: AppRoute.eventDetailsView.path,
                        name: AppRoute.eventDetailsView.name,
                        pageBuilder:
                            (BuildContext context, GoRouterState state) {
                          final id = state.pathParameters['id'];
                          final imageHeroTag =
                              state.pathParameters['imageHeroTag'];
                          return CupertinoPage<void>(
                            key: state.pageKey,
                            child: EventDetailView(
                                id: id, imageHeroTag: imageHeroTag!),
                          );
                        },
                      ),
                      GoRoute(
                        path: AppRoute.moreEventsView.path,
                        name: AppRoute.moreEventsView.name,
                        pageBuilder:
                            (BuildContext context, GoRouterState state) {
                          return CupertinoPage<void>(
                            key: state.pageKey,
                            child: const MoreEventView(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoute.issView.path,
                    name: AppRoute.issView.name,
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        CupertinoPage<void>(
                      key: state.pageKey,
                      maintainState: false,
                      child: BlocProvider(
                        create: (context) =>
                            IssBloc()..add(const FetchIssInfo()),
                        child: const IssView(),
                      ),
                    ),
                    routes: const <RouteBase>[],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoute.settingsView.path,
                    name: AppRoute.settingsView.name,
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
                    path: AppRoute.profileView.path,
                    name: AppRoute.profileView.name,
                    redirect: (BuildContext context, GoRouterState state) {
                      if (!context
                          .read<AuthenticationBloc>()
                          .state
                          .status
                          .isAuthenticated) {
                        return AppRoute.loginView.path;
                      }
                    },
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        CupertinoPage<void>(
                      key: state.pageKey,
                      child: const ProfileView(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ])
  ],
);
