import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/api_provider/astronomic_event_api_provider.dart';

class AstronomicEventRepository {
  final String coordinate;

  AstronomicEventRepository({required this.coordinate}) {
    assert(coordinate.isNotEmpty);
  }

  late final AstronomicEventApiProvider _provider = AstronomicEventApiProvider(
    coordinate: coordinate,
  );

  Future<ResponseEntity> fetchAstronomicEvents(
      {required int page, required int size}) async {
    final response = await _provider.getPageable(page, size);
    return response;
  }

  Future<ResponseEntity> fetchEventCategories() async {
    final response = await _provider.getEventCategories();
    return response;
  }
}
