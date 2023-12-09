import 'package:geolocator/geolocator.dart';

extension PositionExtension on Position {
  String get coordinate => '${latitude.toStringAsFixed(2)},${longitude.toStringAsFixed(2)}';
}