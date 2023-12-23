import 'package:space_app/src/http/const/http_const.dart';
import 'package:space_app/src/http/dio/http_handler/event_http_handler.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/interface/api_provider.dart';

class AstronomicEventApiProvider extends ApiProvider {
  AstronomicEventApiProvider({required String coordinate})
      : super(HttpConst.eventPath,
            interceptor: EventHttpHeaderInterceptor(coordinate: coordinate));

  Future<ResponseEntity> getPageable(int page, int size) async {
    return await get('?page=$page&size=$size');
  }

  Future<ResponseEntity> getEventCategories() {
    return get('/categories');
  }
}
