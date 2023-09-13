import 'package:go_router/go_router.dart';
import 'package:space_app/src/feature/home/home_view.dart';
import 'package:space_app/src/feature/onboarding/onboarding_view.dart';
import 'package:space_app/src/feature/settings/settings_view.dart';
import 'package:space_app/src/ui/space_ui.dart';

enum AppRoute {
  homeView(path: '/'),
  settingsView(path: 'settingsView'),
  onBoardingView(path: '/onBoardingView');

  const AppRoute({required this.path});

  final String path;

  String get location => path.isNotEmpty && !path.startsWith('/') ? '/$path' : path;
}

final GoRouter goRouter = GoRouter(
  initialLocation: AppRoute.onBoardingView.path,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoute.homeView.path,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
      routes: <GoRoute>[
        GoRoute(
          path: AppRoute.settingsView.path,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsView();
          },
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.onBoardingView.path,
      redirect: (BuildContext context, GoRouterState state) {
        if (false) {
          //TODO check if first time
          return AppRoute.homeView.path;
        }
      },
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingView();
      },
    ),
  ],
);
