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
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;

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
