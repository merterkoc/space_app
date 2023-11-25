part of 'astronomic_event_bloc.dart';

@immutable
abstract class AstronomicEventEvent {}

class FetchAstronomicEvent extends AstronomicEventEvent {
  final int page;
  final int size;

  FetchAstronomicEvent({required this.page, required this.size});
}
