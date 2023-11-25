import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/api_provider/astronomic_event_api_provider.dart';

class AstronomicEventRepository {
  final AstronomicEventApiProvider _provider = AstronomicEventApiProvider();

  Future<ResponseEntity> fetchAstronomicEvents(
      {required int page, required int size}) async {
    final response = await _provider.getPageable(page, size);
    return response;
  }
}
