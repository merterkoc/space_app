part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final SpaceAuthenticationStatus status;
  final ResponseEntity<LoginDTO?>? loginResponse;
  final ResponseEntity<LoginDTO?>? registerResponse;

  const AuthenticationState({
    required this.status,
    this.loginResponse,
    this.registerResponse,
  });



  AuthenticationState copyWith({
    SpaceAuthenticationStatus? status,
    ResponseEntity<LoginDTO?>? loginResponse,
    ResponseEntity<LoginDTO?>? registerResponse,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      loginResponse: loginResponse ?? this.loginResponse,
      registerResponse: registerResponse ?? this.registerResponse,
    );
  }

  @override
  List<Object?> get props => [
        status,
        loginResponse,
        registerResponse,
      ];
}
