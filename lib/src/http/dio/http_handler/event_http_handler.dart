import 'dart:async';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:space_app/src/handlers/location_handler.dart';
import 'package:space_app/src/http/dio/http_handler/default_http_handler.dart';
import 'package:space_app/src/util/extensions/position_extension.dart';

/// [DefaultHttpHeaderInterceptor] is used to send default http headers during
/// network request.
class EventHttpHeaderInterceptor extends DefaultHttpHeaderInterceptor {
  final StreamSubscription<Position> locationSubscription =
      LocationHandler().positionStream!.listen((event) {
    coordinate = event.coordinate.toString();
  });

  static String? coordinate;

  EventHttpHeaderInterceptor() {
    locationSubscription.onDone(() {
      coordinate = null;
    });
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers.addAll({
      'Content-Type': 'application/json',
      'coordinate': coordinate,
    });
    handler.next(options);
  }
}
