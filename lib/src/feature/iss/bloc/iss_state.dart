part of 'iss_bloc.dart';

class IssState extends Equatable {
  final List<ISSPositionEntity> issCoordinateList;

  const IssState({required this.issCoordinateList});

  factory IssState.initial() =>
      const IssState(issCoordinateList: <ISSPositionEntity>[]);

  IssState copyWith({List<ISSPositionEntity>? issCoordinateList}) {
    return IssState(
      issCoordinateList: issCoordinateList ?? this.issCoordinateList,
    );
  }

  @override
  List<Object> get props => [issCoordinateList];
}
