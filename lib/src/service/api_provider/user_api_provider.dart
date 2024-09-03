import 'package:space_app/src/http/const/http_const.dart';
import 'package:space_app/src/http/dio/http_handler/event_http_handler.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/interface/api_provider.dart';
import 'package:space_app/src/service/model/user_info_dto.dart';

class UserApiProvider extends ApiProvider {
  UserApiProvider()
      : super(
          HttpConst.userPath,
        );

  Future<ResponseEntity> getUserInfo() async {
    return await get('/info');
  }
}
