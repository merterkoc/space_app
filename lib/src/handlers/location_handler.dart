import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationHandler {
  static final LocationHandler _instance = LocationHandler._internal();

  factory LocationHandler() => _instance;

  LocationHandler._internal();

  Position? _position;

  Position? get position => _position;

  Stream<Position>? get positionStream => _positionStream;

  final GeolocatorPlatform _geoLocatorPlatform = GeolocatorPlatform.instance;

  final Stream<Position> _positionStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.lowest,
      distanceFilter: 30,
    ),
  );

  Future<void> initialize() async {
    await isLocationServiceEnabled().then(
      (value) async {
        final permission = await requestPermission();
        final hasPermission = permission != LocationPermission.denied &&
            permission != LocationPermission.deniedForever;
        if (value && hasPermission) {
          _position = await getCurrentLocation().timeout(
            const Duration(seconds: 2),
            onTimeout: () => getLastKnownPosition(),
          );
        } else {
          await requestPermission().then(
            (value) async {
              if (value != LocationPermission.denied) {
                _position = await getCurrentLocation().timeout(
                  const Duration(seconds: 2),
                  onTimeout: () => getLastKnownPosition(),
                );
              }
            },
          );
        }
      },
    ).catchError(
      (error) {
        debugPrint(error.toString());
      },
    );
  }

  Future<bool> checkPermission() async {
    var permission = await Geolocator.checkPermission();
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  Future<bool> isLocationServiceEnabled() =>
      _geoLocatorPlatform.isLocationServiceEnabled();

  void openLocationSettings() => _geoLocatorPlatform.openLocationSettings();

  Future<LocationPermission> requestPermission() =>
      _geoLocatorPlatform.requestPermission();

  Future<Position?> getCurrentLocation() async {
    try {
      _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      rethrow;
    }
    return _position;
  }

  Future<Position?> getLastKnownPosition() async {
    try {
      _position = await Geolocator.getLastKnownPosition();
    } catch (e) {
      debugPrint(e.toString());
    }
    return _position;
  }
}
