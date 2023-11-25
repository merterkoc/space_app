import 'package:space_app/src/http/const/http_const.dart';
import 'package:space_app/src/http/dio/http_handler/default_http_handler.dart';
import 'package:space_app/src/http/dio/interface/i_dio_client.dart';

class DioClient extends IDioClient {
  factory DioClient() => _instance;

  DioClient._()
      : super(
            url: HttpConst.baseUrl,
            interceptor: DefaultHttpHeaderInterceptor());

  // Singleton instance
  static final DioClient _instance = DioClient._();
}
