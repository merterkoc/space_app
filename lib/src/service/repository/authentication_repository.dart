import 'package:fresh_dio/fresh_dio.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/service/api_provider/authentication_api_provider.dart';
import 'package:space_app/src/service/model/login_dto.dart';

class AuthenticationRepository {
  final AuthenticationApiProvider _provider = AuthenticationApiProvider();

  Stream<SpaceAuthenticationStatus> get authenticationStatus =>
      _provider.authenticationStatus;

  Future<LoginDTO> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _provider.signUp(
      email: email,
      password: password,
      name: name,
    );
    return response;
  }

  Future<LoginDTO> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _provider.signIn(
      email: email,
      password: password,
    );
    return response;
  }

  void logout() {
    _provider.logout();
  }
}
