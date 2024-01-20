part of 'iss_bloc.dart';

class IssState extends Equatable {
  final CoordinateDTO issCoordinate;

  const IssState({required this.issCoordinate});

  factory IssState.initial() =>
      IssState(issCoordinate: CoordinateDTO(latitude: 0, longitude: 0));

  IssState copyWith({CoordinateDTO? issCoordinate}) {
    return IssState(
      issCoordinate: issCoordinate ?? this.issCoordinate,
    );
  }

  @override
  List<Object> get props => [issCoordinate];
}
