import 'package:equatable/equatable.dart';
import 'package:space_app/src/service/model/token_dto.dart';

class LoginDTO extends Equatable {
  final int statusCode;
  final TokenDTO data;
  final String? message;

  const LoginDTO({
    required this.statusCode,
    required this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        statusCode,
        data,
        message,
      ];

  static LoginDTO fromJson(data) {
    return LoginDTO(
      statusCode: data['code'] as int,
      data: TokenDTO.fromJson(data['data']),
      message: data['message'] as String?,
    );
  }
}
