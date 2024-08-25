part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final SpaceAuthenticationStatus status;

  const AuthenticationState({
    required this.status,
  });

  AuthenticationState copyWith({
    SpaceAuthenticationStatus? status,
    UserDTO? user,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
