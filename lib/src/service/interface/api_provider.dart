import 'package:space_app/src/http/dio/dio_client.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';

abstract class ApiProvider {
  final DioClient dio = DioClient();

  ApiProvider(this._path);

  final String _path;

  Future<ResponseEntity<dynamic>> get([String? path]) async {
    final response = await dio.get<Map<String, dynamic>>('$_path/$path');
    return response;
  }

  Future<Map<String, dynamic>> post(Map<String, dynamic> data) async {
    final response = await dio.post<Map<String, dynamic>>(_path, data: data);
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> put(Map<String, dynamic> data) async {
    final response = await dio.put<Map<String, dynamic>>(_path, data: data);
    return response.data as Map<String, dynamic>;
  }

  Future<void> deleteById(String id) async {
    await dio.delete<Map<String, dynamic>>('$_path/$id');
  }
}
