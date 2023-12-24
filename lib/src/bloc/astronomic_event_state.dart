part of 'astronomic_event_bloc.dart';

class AstronomicEventState extends Equatable {
  final RequestState astronomicEventListRequestState;
  final RequestState eventListByCategoryRequestState;
  final List<AstronomicEventDTO> events;
  final List<AstronomicEventDTO> eventsByCategory;
  final List<AstronomicEventDTO> eventCache;
  final List<String> eventCategories;
  final int selectedCategoryIndex;

  const AstronomicEventState({
    this.astronomicEventListRequestState = RequestState.initialized,
    this.eventListByCategoryRequestState = RequestState.initialized,
    this.events = const [],
    this.eventsByCategory = const [],
    this.eventCache = const [],
    this.eventCategories = const [],
    this.selectedCategoryIndex = 0,
  });

  String? get selectedCategory => eventCategories.isNotEmpty ? eventCategories[selectedCategoryIndex]: null;

  AstronomicEventState copyWith({
    RequestState? astronomicEventListRequestState,
    RequestState? eventListByCategoryRequestState,
    List<AstronomicEventDTO>? events,
    List<AstronomicEventDTO>? eventsByCategory,
    List<AstronomicEventDTO>? eventCache,
    List<String>? eventCategories,
    int? selectedCategoryIndex,
  }) {
    return AstronomicEventState(
      events: events ?? this.events,
      astronomicEventListRequestState: astronomicEventListRequestState ??
          this.astronomicEventListRequestState,
      eventListByCategoryRequestState: eventListByCategoryRequestState ??
          this.eventListByCategoryRequestState,
      eventCache: eventCache ?? this.eventCache,
      eventCategories: eventCategories ?? this.eventCategories,
      eventsByCategory: eventsByCategory ?? this.eventsByCategory,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }

  bool selectedCategoryIs(String category) =>
      eventCategories[selectedCategoryIndex] == category;

  @override
  List<Object?> get props => [
        astronomicEventListRequestState,
        eventListByCategoryRequestState,
        events,
        eventsByCategory,
        eventCache,
        eventCategories,
        selectedCategoryIndex,
      ];
}
