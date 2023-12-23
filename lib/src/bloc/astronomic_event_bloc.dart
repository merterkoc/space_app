import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  AstronomicEventBloc() : super(const AstronomicEventState()) {
    on<FetchAstronomicEvent>(
        (event, emit) => _onFetchAstronomicEvent(event, emit));
    on<FetchEventCategories>(
        (event, emit) => _onFetchEventCategories(event, emit));
    on<SelectEventCategory>(
        (event, emit) => _onSelectEventCategory(event, emit));
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
            eventCache: [...state.eventCache, ...data],
            events: data,
            astronomicEventListRequestState: RequestState.success,
          ),
        );
      }
    } else {
      emit(state.copyWith(astronomicEventListRequestState: RequestState.error));
    }
  }

  Future<void> _onFetchEventCategories(
      FetchEventCategories event, Emitter<AstronomicEventState> emit) async {
    await _astronomicEventRepository.fetchEventCategories().then(
      (categories) {
        if (categories.isOk) {
          final data = (categories.data!['data']['categories'] as List<dynamic>)
              .map((e) => e as String)
              .toList();
          emit(state.copyWith(
            eventCategories: data,
          ));
        }
      },
    );
  }

  void _onSelectEventCategory(
      SelectEventCategory event, Emitter<AstronomicEventState> emit) {
    emit(state.copyWith(selectedCategoryIndex: event.categoryIndex));
  }
}
