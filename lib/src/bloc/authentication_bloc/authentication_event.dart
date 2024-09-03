part of 'authentication_bloc.dart';

enum SpaceAuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated;

  bool get isUnknown => this == SpaceAuthenticationStatus.unknown;

  bool get isAuthenticated => this == SpaceAuthenticationStatus.authenticated;

  bool get isUnauthenticated =>
      this == SpaceAuthenticationStatus.unauthenticated;
}

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class StatusChanged extends AuthenticationEvent {
  final SpaceAuthenticationStatus status;

  const StatusChanged(this.status);
}

class SignUpRequested extends AuthenticationEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;

  const SignUpRequested(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.name});
}

class SignInRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInRequested({required this.email, required this.password});
}

class LoginRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});
}

class LogoutRequested extends AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final SpaceAuthenticationStatus status;

  const AuthenticationStatusChanged({required this.status});
}
