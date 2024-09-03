import 'package:equatable/equatable.dart';

class UserInfoDTO extends Equatable {
  final String name;
  final String? email;
  final String? avatar;
  final String? createdAt;

  const UserInfoDTO({
    required this.name,
    this.email,
    this.avatar,
    this.createdAt,
  });

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) => UserInfoDTO(
        name: json['name'] as String,
        email: json['email'] as String?,
        avatar: json['avatar'] as String?,
        createdAt: json['createdAt'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['createdAt'] = createdAt;
    return data;
  }

  @override
  List<Object?> get props => [
        name,
        email,
        avatar,
        createdAt,
      ];
}
