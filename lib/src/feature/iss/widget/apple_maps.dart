import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/feature/iss/bloc/iss_bloc.dart';
import 'package:space_app/src/ui/space_ui.dart';

class AppleMaps extends StatefulWidget {
  final IssState state;

  const AppleMaps({super.key, required this.state});

  @override
  State<AppleMaps> createState() => _AppleMapsState();
}

class _AppleMapsState extends State<AppleMaps> {
  @override
  Widget build(BuildContext context) {
    late AppleMapController? mapController;
    void onMapCreated(AppleMapController controller) {
      mapController = controller;
      context.read<IssBloc>().add(const FetchIssInfo());
    }

    return Stack(
      children: <Widget>[
        AppleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            zoom: 2,
            target: LatLng(
              widget.state.issCoordinateList.last.latitude,
              widget.state.issCoordinateList.last.longitude,
            ),
          ),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          polylines: {
            Polyline(
              polylineId: PolylineId('iss'),
              color: SpaceColors.white,
              width: 2,
              points: widget.state.issCoordinateList
                  .map((coordinate) => LatLng(
                        (coordinate.latitude),
                        coordinate.longitude,
                      ))
                  .toList(),
            ),
          },
          annotations: {
            Annotation(
              annotationId: AnnotationId('iss'),
              icon: BitmapDescriptor.markerAnnotation,
              position: LatLng(
                widget.state.issCoordinateList.last.latitude,
                widget.state.issCoordinateList.last.longitude,
              ),
            ),
          },
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: CupertinoButton(
              onPressed: () {
                mapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      zoom: 2,
                      target: LatLng(
                        widget.state.issCoordinateList.last.latitude,
                        widget.state.issCoordinateList.last.longitude,
                      ),
                    ),
                  ),
                );
              },
              child: const Icon(
                CupertinoIcons.location,
                color: SpaceColors.white,
              ),
            ))
      ],
    );
  }
}
