part of 'astronomic_event_bloc.dart';

class AstronomicEventState extends Equatable {
  final RequestState astronomicEventListRequestState;
  final List<AstronomicEventDTO> events;
  final List<AstronomicEventDTO> eventCache;
  final List<String> eventCategories;
  final int selectedCategoryIndex;

  const AstronomicEventState({
    this.astronomicEventListRequestState = RequestState.initialized,
    this.events = const [],
    this.eventCache = const [],
    this.eventCategories = const [],
    this.selectedCategoryIndex = 0,
  });

  AstronomicEventState copyWith({
    RequestState? astronomicEventListRequestState,
    List<AstronomicEventDTO>? events,
    List<AstronomicEventDTO>? eventCache,
    List<String>? eventCategories,
    int? selectedCategoryIndex,
  }) {
    return AstronomicEventState(
      events: events ?? this.events,
      astronomicEventListRequestState: astronomicEventListRequestState ??
          this.astronomicEventListRequestState,
      eventCache: eventCache ?? this.eventCache,
      eventCategories: eventCategories ?? this.eventCategories,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }

  bool selectedCategoryIs(String category) =>
      eventCategories[selectedCategoryIndex] == category;

  @override
  List<Object?> get props => [
        astronomicEventListRequestState,
        events,
        eventCache,
        eventCategories,
        selectedCategoryIndex,
      ];
}
