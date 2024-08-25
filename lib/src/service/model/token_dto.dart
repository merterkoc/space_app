import 'package:equatable/equatable.dart';

class TokenDTO extends Equatable {
  final String accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? scope;
  final String? refreshToken;

  const TokenDTO({
    required this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.scope,
    this.refreshToken,
  });

  factory TokenDTO.fromJson(Map<String, dynamic> json) => TokenDTO(
        accessToken: json['accessToken'] as String,
        tokenType: json['tokenType'] as String?,
        expiresIn: json['expiresIn'] as int?,
        scope: json['scope'] as String?,
        refreshToken: json['refreshToken'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['scope'] = scope;
    data['refresh_token'] = refreshToken;
    return data;
  }

  @override
  List<Object?> get props => [
        accessToken,
        tokenType,
        expiresIn,
        scope,
        refreshToken,
      ];
}
