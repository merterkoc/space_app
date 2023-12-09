import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:space_app/src/handlers/location_handler.dart';
import 'package:space_app/src/http/dio/model/request_state.dart';
import 'package:space_app/src/service/model/astronomic_event_dto.dart';
import 'package:space_app/src/service/repository/astronomic_event_repository.dart';
import 'package:space_app/src/util/extensions/position_extension.dart';

part 'astronomic_event_event.dart';

part 'astronomic_event_state.dart';

class AstronomicEventBloc
    extends Bloc<AstronomicEventEvent, AstronomicEventState> {
  AstronomicEventBloc() : super(AstronomicEventState.initial()) {
    on<FetchAstronomicEvent>(
        (event, emit) => _onFetchAstronomicEvent(event, emit));
  }

  final AstronomicEventRepository _astronomicEventRepository =
      AstronomicEventRepository(
          coordinate: LocationHandler().position!.coordinate);

  Future<void> _onFetchAstronomicEvent(
      FetchAstronomicEvent event, Emitter<AstronomicEventState> emit) async {
    emit(state.copyWith(astronomicEventListRequestState: RequestState.loading));
    final response = await _astronomicEventRepository.fetchAstronomicEvents(
        page: event.page, size: event.size);
    if (response.isOk) {
      List<AstronomicEventDTO>? data;
      if (response.data != null) {
        data = (response.data!['data'] as List<dynamic>)
            .map((e) => AstronomicEventDTO.fromJson(e as Map<String, dynamic>))
            .toList();
        emit(
          state.copyWith(
            events: data,
            astronomicEventListRequestState: RequestState.success,
          ),
        );
      }
    } else {
      emit(state.copyWith(astronomicEventListRequestState: RequestState.error));
    }
  }
}
