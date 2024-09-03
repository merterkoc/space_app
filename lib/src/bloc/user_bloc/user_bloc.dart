import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_app/src/service/model/user_info_dto.dart';
import 'package:space_app/src/service/repository/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository = UserRepository();

  UserBloc() : super(const UserState.initial()) {
    on<GetUserEvent>(_onGetUserEvent);
    on<ClearUserEvent>(_onClearUserEvent);
  }

  Future<void> _onGetUserEvent(
      GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserState.loading(state.userInfo));
    try {
      final response = await _repository.fetchUserInfo();
      if (response.isOk) {
        emit(UserState.success(UserInfoDTO.fromJson(response.data!['data'])));
      } else {
        emit(UserState.error(response.message));
      }
    } on Exception {
      emit(const UserState.error('Something went wrong'));
    }
  }

  FutureOr<void> _onClearUserEvent(
      ClearUserEvent event, Emitter<UserState> emit) {
    emit(const UserState.initial());
  }
}
