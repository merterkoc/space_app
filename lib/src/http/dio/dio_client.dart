import 'package:dio/dio.dart';
import 'package:space_app/src/http/const/http_const.dart';
import 'package:space_app/src/http/dio/interface/i_dio_client.dart';

class DioClient extends IDioClient {
  static DioClient? _instance;
  final Interceptor? interceptor;

  factory DioClient({Interceptor? interceptor}) {
    _instance ??= DioClient._internal(interceptor: interceptor);
    return _instance!;
  }

  DioClient._internal({this.interceptor})
      : super(
    url: HttpConst.baseUrl,
    interceptor: interceptor,
  );

}