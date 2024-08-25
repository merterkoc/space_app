import 'package:fresh_dio/fresh_dio.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/http/const/http_const.dart';
import 'package:space_app/src/http/dio/http_handler/default_http_handler.dart';
import 'package:space_app/src/service/interface/api_provider.dart';
import 'package:space_app/src/service/model/login_dto.dart';

class AuthenticationApiProvider extends ApiProvider {
  AuthenticationApiProvider()
      : super(HttpConst.identity, interceptor: DefaultHttpHeaderInterceptor());

  Stream<SpaceAuthenticationStatus> get authenticationStatus {
    return dioClient.authenticationStatus.map((status) {
      switch (status) {
        case AuthenticationStatus.authenticated:
          return SpaceAuthenticationStatus.authenticated;
        case AuthenticationStatus.unauthenticated:
          return SpaceAuthenticationStatus.unauthenticated;
        case AuthenticationStatus.initial:
          return SpaceAuthenticationStatus.unknown;
      }
    });
  }

  Future<LoginDTO> signUp(
      {required String email,
      required String password,
      required String name}) async {
    final response = await post(HttpConst.signUpPath, {
      'email': email,
      'password': password,
      'name': name,
    });
    final loginDTO = LoginDTO.fromJson(response.data);
    await dioClient
        .setToken(OAuth2Token(accessToken: loginDTO.data.accessToken));
    return loginDTO;
  }

  Future<LoginDTO> signIn(
      {required String email, required String password}) async {
    final response = await post(HttpConst.loginPath, {
      'email': email,
      'password': password,
    });
    final loginDTO = LoginDTO.fromJson(response.data);
    await dioClient
        .setToken(OAuth2Token(accessToken: loginDTO.data.accessToken));
    return loginDTO;
  }

  Future<void> logout() async {
    await dioClient.logout();
  }
}
