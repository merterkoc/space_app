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
