import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/api_provider/iss_api_provider.dart';

class ISSRepository {
  late final ISSApiProvider _provider = ISSApiProvider();

  Future<ResponseEntity> fetchISSPosition() async {
    final response = await _provider.getISSPosition();
    return response;
  }
}
