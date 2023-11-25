class ResponseEntity<T> {
  ResponseEntity({required this.statusCode, this.message, this.data});

  ResponseEntity.fromJson(
    Map<String, dynamic> json,
    this.statusCode,
    this.message,
    this.data,
  ) {
    statusCode = json['code'] as int;
    message = json['message'] != null ? json['message'] as String : null;
    data = json['data'] != null ? json['data'] as T : null;
  }

  late final int statusCode;
  late final String? message;
  late final T? data;

  static Map<String, dynamic> toJson(ResponseEntity<dynamic> response) {
    final data = <String, dynamic>{};
    data['code'] = response.statusCode;
    data['message'] = response.message;
    data['data'] = response.data;
    return data;
  }

  bool get isOk => statusCode == 200 || statusCode == 201;
}
