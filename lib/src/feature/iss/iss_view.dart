import 'dart:ui';

import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/feature/iss/bloc/iss_bloc.dart';
import 'package:space_app/src/feature/iss/widget/apple_maps.dart';
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
      child: FutureBuilder(
        future: _createMarker(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocBuilder<IssBloc, IssState>(
              buildWhen: (previous, current) =>
                  previous.issCoordinateList != current.issCoordinateList,
              builder: (context, state) {
                if (state.issCoordinateList.isNotEmpty) {
                  return AppleMaps(state: state);
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
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

  Future<BitmapDescriptor> createCircleBitmap(Size size, red) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = red;
    final Radius radius = Radius.circular(size.width / 2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        radius,
      ),
      paint,
    );
    final img = pictureRecorder.endRecording();
    return BitmapDescriptor.fromBytes(
      await img
          .toImage(size.width.toInt(), size.height.toInt())
          .then((value) => value.toByteData(format: ImageByteFormat.png))
          .then((value) => value!.buffer.asUint8List()),
    );
  }

  Future<void> _createMarker() async {}
}
