part of 'iss_bloc.dart';

abstract class IssEvent extends Equatable {
  const IssEvent();

  @override
  List<Object> get props => [];
}

class FetchIssInfo extends IssEvent {
  const FetchIssInfo();
}

class StopIssInfo extends IssEvent {
  const StopIssInfo();
}