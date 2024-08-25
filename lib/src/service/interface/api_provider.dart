import 'package:dio/dio.dart';
import 'package:space_app/src/http/dio/dio_client.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';

abstract class ApiProvider {
  late final DioClient _dio = DioClient(interceptor: interceptor);

  ApiProvider(this._path, {this.interceptor});

  final String _path;

  final Interceptor? interceptor;

  Future<ResponseEntity<dynamic>> get([String? path]) async {
    path ??= '';
    final response = await _dio.get<Map<String, dynamic>>('$_path/$path');
    return response;
  }

  Future<ResponseEntity<dynamic>> post([String? path, Map<String, dynamic>? data]) async {
    final response = await _dio.post<Map<String, dynamic>>('$_path/$path', data: data);
    return response;
  }

  Future<Map<String, dynamic>> put(Map<String, dynamic> data) async {
    final response = await _dio.put<Map<String, dynamic>>(_path, data: data);
    return response.data as Map<String, dynamic>;
  }

  Future<void> deleteById(String id) async {
    await _dio.delete<Map<String, dynamic>>('$_path/$id');
  }

  DioClient get dioClient => _dio;
}
