import 'package:space_app/src/http/dio/http_handler/event_http_handler.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/interface/api_provider.dart';

class AstronomicEventApiProvider extends ApiProvider {
  AstronomicEventApiProvider({required String coordinate})
      : super('api/client/event',
            interceptor: EventHttpHeaderInterceptor(coordinate: coordinate));

  Future<ResponseEntity> getPageable(int page, int size) async {
    return await get('?page=$page&size=$size');
  }
}
