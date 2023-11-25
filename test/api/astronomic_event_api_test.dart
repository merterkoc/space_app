import 'package:flutter_test/flutter_test.dart';
import 'package:space_app/src/service/repository/astronomic_event_repository.dart';

void main() {
  late final AstronomicEventRepository repository;
  setUp(() {
    repository = AstronomicEventRepository();
  });
  test('Test get', () async {
    final events = await repository.fetchAstronomicEvents(page: 1, size: 1);
    expect(events.statusCode, 200);
  });
}
