import 'package:dio/dio.dart';
import 'package:space_app/src/http/dio/http_handler/default_http_handler.dart';

/// [DefaultHttpHeaderInterceptor] is used to send default http headers during
/// network request.
class EventHttpHeaderInterceptor extends DefaultHttpHeaderInterceptor {
  final String coordinate;

  EventHttpHeaderInterceptor({required this.coordinate});
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
