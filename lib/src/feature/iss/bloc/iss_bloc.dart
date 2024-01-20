import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_app/src/service/model/coordinate_dto.dart';
import 'package:space_app/src/service/repository/iss_repository.dart';

part 'iss_event.dart';

part 'iss_state.dart';

class IssBloc extends Bloc<IssEvent, IssState> {
  IssBloc() : super(IssState.initial()) {
    on<FetchIssInfo>(_onFetchIssInfo);
    on<StopIssInfo>(_onStopIssInfo);
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    await super.close();
  }

  final _issRepository = ISSRepository();
  late Timer? _timer;

  Future<void> _onFetchIssInfo(
      FetchIssInfo event, Emitter<IssState> emit) async {
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        try {
          _fetchIssInfo();
        } on Exception {
          rethrow;
        }
      },
    );
  }

  void _fetchIssInfo() async {
    await _issRepository.fetchISSPosition().then((result) {
      if (result.isOk) {
        emit(
          state.copyWith(
            issCoordinate:
                CoordinateDTO.fromJson(result.data!['data']['coordinate']),
          ),
        );
      }
    });
  }

  void _onStopIssInfo(event, Emitter<IssState> emit) {
    _timer?.cancel();
  }
}
