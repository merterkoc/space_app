import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:space_app/src/http/dio/http_handler/default_http_handler.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/http/dio/token_storage/token_storage.dart';

/// [IDioClient] is used to handle http rest api calls.
abstract class IDioClient {
  IDioClient({
    required String url,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Interceptor? interceptor,
  }) {
    baseUrl = url;
    _dio
      ..options.baseUrl = url.endsWith('/') ? url : '$url/'
      ..options.connectTimeout = connectTimeout ?? const Duration(seconds: 10)
      ..options.receiveTimeout = receiveTimeout ?? const Duration(seconds: 10)
      ..options.responseType = ResponseType.json
      ..interceptors.add(interceptor ?? DefaultHttpHeaderInterceptor())
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      )
      ..interceptors.add(_fresh);
  }

  late final String baseUrl;

  final Dio _dio = Dio();

  final _fresh = Fresh.oAuth2(
    tokenHeader: (token) {
      return {
        'Authorization': 'Bearer ${token.accessToken}',
      };
    },
    tokenStorage: TokenStorageImpl(),
    shouldRefresh: (response) {
      return response?.statusCode == 401 || response?.statusCode == 403;
    },
    refreshToken: (token, client) {
      throw RevokeTokenException();
    },
  );

  /// http get call
  Future<ResponseEntity<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode == 200) {}
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// http post call
  Future<ResponseEntity<T>> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _dio.post<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// http put call
  Future<ResponseEntity<T>> put<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _dio.put<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// http delete call
  Future<ResponseEntity<T>> delete<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _dio.delete<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ResponseEntity<T>> _handleResponse<T>(
    Response<T> response,
  ) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(
        ResponseEntity<T>(
          statusCode: response.statusCode!,
          data: response.data as T,
        ),
      );
    } else {
      return Future.value(
        ResponseEntity(
          data: response.data as T,
          message: response.statusMessage,
          statusCode: response.statusCode!,
        ),
      );
    }
  }

  Future<ResponseEntity<T>> _handleError<T>(
    dynamic e,
  ) {
    final error = e as DioException;
    if (error.response != null) {
      return Future.value(
        ResponseEntity<T>(
          statusCode: error.response!.statusCode!,
          message: error.response!.statusMessage,
          data:
              error.response!.statusCode == 200 && error.response?.data != null
                  ? error.response?.data as T
                  : null,
        ),
      );
    } else {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return Future.value(
          ResponseEntity<T>(
            statusCode: 408,
            message: 'Connection timeout',
          ),
        );
      } else {
        return Future.value(
          ResponseEntity<T>(
            statusCode: 601,
            message: 'Unknown error',
          ),
        );
      }
    }
  }

  /// Listener for authorization status changes
  Stream<AuthenticationStatus> get authenticationStatus =>
      _fresh.authenticationStatus;

  Future<void> setToken(OAuth2Token token) => _fresh.setToken(token);

  Future<void> logout() {
    return _fresh.clearToken();
  }
}
