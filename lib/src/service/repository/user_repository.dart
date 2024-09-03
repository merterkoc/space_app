import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/api_provider/astronomic_event_api_provider.dart';
import 'package:space_app/src/service/api_provider/user_api_provider.dart';

class UserRepository {
  final UserApiProvider _provider = UserApiProvider();

  Future<ResponseEntity> fetchUserInfo() async {
    final response = await _provider.getUserInfo();
    return response;
  }
}
