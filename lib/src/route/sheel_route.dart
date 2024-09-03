import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/bloc/user_bloc/user_bloc.dart';
import 'package:space_app/src/handlers/location_handler.dart';
import 'package:space_app/src/ui/space_ui.dart';

class ShellView extends StatefulWidget {
  final Widget child;

  const ShellView({super.key, required this.child});

  @override
  State<ShellView> createState() => _ShellViewState();
}

class _ShellViewState extends State<ShellView>
    with AutomaticKeepAliveClientMixin<ShellView>, WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) =>
              (previous.status != current.status) && !previous.status.isUnknown,
          listener: (context, state) {
            if (state.status.isAuthenticated) {
              goRouter.goNamed(AppRoute.profileView.name);
            } else if (state.status.isUnauthenticated) {
              goRouter.goNamed(AppRoute.homeView.name);
              context.read<UserBloc>().add(const ClearUserEvent());
            }
          },
        ),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) =>
              previous.status.isAuthenticated != current.status.isAuthenticated,
          listener: (context, state) {
            if (state.status.isAuthenticated) {
              context.read<UserBloc>().add(const GetUserEvent());
            } else if (state.status.isUnauthenticated) {
              context.read<UserBloc>().add(const ClearUserEvent());
            }
          },
        ),
      ],
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: widget.child),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    debugPrint('didChangePlatformBrightness');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        resume();
      case AppLifecycleState.detached:
        detached;
      case AppLifecycleState.hidden:
        hidden;
      case AppLifecycleState.inactive:
        inactive;
      case AppLifecycleState.paused:
        paused;
    }
  }

  void resume() {
    debugPrint('AppLifecycleState.resumed');
    LocationHandler().checkPermission().then((value) => value
        ? goRouter.goNamed(AppRoute.homeView.name)
        : goRouter.goNamed(AppRoute.permissionView.name));
  }

  void detached() {}

  void hidden() {}

  void inactive() {}

  void paused() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
}
