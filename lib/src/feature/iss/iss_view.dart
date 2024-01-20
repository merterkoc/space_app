import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/feature/iss/bloc/iss_bloc.dart';
import 'package:space_app/src/ui/space_ui.dart';

class IssView extends StatefulWidget {
  const IssView({super.key});

  @override
  State<IssView> createState() => _IssViewState();
}

class _IssViewState extends State<IssView> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: BlocBuilder<IssBloc, IssState>(
          buildWhen: (previous, current) =>
              previous.issCoordinate != current.issCoordinate,
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ISS Position',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Latitude: ${state.issCoordinate.latitude}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Longitude: ${state.issCoordinate.longitude}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final issBloc = context.read<IssBloc>();
    if (state == AppLifecycleState.resumed) {
      issBloc.add(const FetchIssInfo());
    } else if (state == AppLifecycleState.paused) {
      issBloc.add(const StopIssInfo());
    }
  }
}
