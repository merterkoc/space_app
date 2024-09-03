import 'package:space_app/src/service/model/enum/request_status.dart';

class ResponseEntity<T> {
  ResponseEntity(
      {required this.statusCode,
      this.message,
      this.data,
      this.status = RequestStatus.initial});

  factory ResponseEntity.initial({T? data, int statusCode = 200}) {
    return ResponseEntity(
      statusCode: statusCode,
      data: data,
      status: RequestStatus.initial,
    );
  }

  factory ResponseEntity.loading({T? data, int statusCode = 200}) {
    return ResponseEntity(
      statusCode: statusCode,
      data: data,
      status: RequestStatus.loading,
    );
  }

  factory ResponseEntity.success({T? data, int statusCode = 200}) {
    return ResponseEntity(
      statusCode: statusCode,
      data: data,
      status: RequestStatus.success,
    );
  }

  factory ResponseEntity.error({String? message, int statusCode = 400, data}) {
    return ResponseEntity(
      statusCode: statusCode,
      message: message,
      status: RequestStatus.error,
      data: data,
    );
  }

  late final int statusCode;
  late final String? message;
  late final T? data;
  late final RequestStatus status;

  static Map<String, dynamic> toJson(ResponseEntity<dynamic> response) {
    final data = <String, dynamic>{};
    data['code'] = response.statusCode;
    data['message'] = response.message;
    data['data'] = response.data;
    return data;
  }

  bool get isOk => statusCode == 200 || statusCode == 201;
}
