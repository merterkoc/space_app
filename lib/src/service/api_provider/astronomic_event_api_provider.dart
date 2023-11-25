import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/interface/api_provider.dart';

class AstronomicEventApiProvider extends ApiProvider {
  AstronomicEventApiProvider() : super('api/client/event');

  Future<ResponseEntity> getPageable(int page, int size) async {
    return await get('?page=$page&size=$size');
  }
}
