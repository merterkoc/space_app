import 'package:space_app/src/http/const/http_const.dart';
import 'package:space_app/src/http/dio/http_handler/default_http_handler.dart';
import 'package:space_app/src/http/dio/model/response_entity.dart';
import 'package:space_app/src/service/interface/api_provider.dart';

class ISSApiProvider extends ApiProvider {
  ISSApiProvider()
      : super(HttpConst.issPath, interceptor: DefaultHttpHeaderInterceptor());

  Future<ResponseEntity> getISSPosition() async {
    return get();
  }
}
