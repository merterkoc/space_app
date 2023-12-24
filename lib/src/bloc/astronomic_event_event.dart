part of 'astronomic_event_bloc.dart';

@immutable
abstract class AstronomicEventEvent extends Equatable {
  const AstronomicEventEvent();

  @override
  List<Object?> get props => [];
}

class FetchAstronomicEvent extends AstronomicEventEvent {
  final int page;
  final int size;

  const FetchAstronomicEvent({required this.page, required this.size});
}

class FetchEventCategories extends AstronomicEventEvent {}

class SelectEventCategory extends AstronomicEventEvent {
  final int categoryIndex;

  const SelectEventCategory({required this.categoryIndex});
}

class FetchAstronomicEventByCategory extends AstronomicEventEvent {
  final String? category;
  final int page;
  final int size;

  const FetchAstronomicEventByCategory({
    required this.category,
    required this.page,
    required this.size,
  });
}
