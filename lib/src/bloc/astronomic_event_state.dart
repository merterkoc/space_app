part of 'astronomic_event_bloc.dart';

@immutable
class AstronomicEventState {
  final RequestState astronomicEventListRequestState;
  final List<AstronomicEventDTO> events;

  const AstronomicEventState({
    required this.astronomicEventListRequestState,
    required this.events,
  });

  factory AstronomicEventState.initial() {
    return const AstronomicEventState(
      astronomicEventListRequestState: RequestState.initialized,
      events: [],
    );
  }

  AstronomicEventState copyWith({
    RequestState? astronomicEventListRequestState,
    List<AstronomicEventDTO>? events,
  }) {
    return AstronomicEventState(
      events: events ?? this.events,
      astronomicEventListRequestState: astronomicEventListRequestState ??
          this.astronomicEventListRequestState,
    );
  }
}
