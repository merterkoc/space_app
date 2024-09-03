import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/model/login_dto.dart';
import 'package:space_app/src/service/repository/authentication_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(const AuthenticationState(
            status: SpaceAuthenticationStatus.unknown)) {
    on<StatusChanged>((event, emit) => _onStatusChanged(event, emit));
    on<SignUpRequested>((event, emit) => _onSignUpRequested(event, emit));
    on<SignInRequested>((event, emit) => _onSignInRequested(event, emit));
    on<LogoutRequested>((event, emit) => _onLogoutRequested(emit));

    _authenticationStatusStream =
        _repository.authenticationStatus.listen((status) {
      add(StatusChanged(status));
    });
  }

  final AuthenticationRepository _repository = AuthenticationRepository();

  late final StreamSubscription<SpaceAuthenticationStatus>
      _authenticationStatusStream;

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(registerResponse: ResponseEntity.loading()));
    final response = await _repository.signUp(
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
      name: event.name,
    );
    emit(
      state.copyWith(registerResponse: response),
    );
    if (response.statusCode == 200) {
      emit(const AuthenticationState(
          status: SpaceAuthenticationStatus.authenticated));
    } else {
      emit(const AuthenticationState(
          status: SpaceAuthenticationStatus.unauthenticated));
    }
  }

  _onSignInRequested(
      SignInRequested event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(loginResponse: ResponseEntity.loading()));
      final responseEntity = await _repository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(
        state.copyWith(loginResponse: responseEntity),
      );
    } on Error {
      emit(
        state.copyWith(
          loginResponse: ResponseEntity.error(
            message: '',
          ),
        ),
      );
    }
  }

  _onLogoutRequested(Emitter<AuthenticationState> emit) {
    _repository.logout();
  }

  _onStatusChanged(StatusChanged event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState(status: event.status));
  }

  @override
  Future<void> close() {
    _authenticationStatusStream.cancel();
    return super.close();
  }
}
