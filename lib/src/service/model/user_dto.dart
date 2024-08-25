import 'package:equatable/equatable.dart';

class UserDTO extends Equatable {
  final String name;
  final String? email;

  const UserDTO({required this.name, this.email});

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        name: json['name'] as String,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }

  @override
  List<Object?> get props => [
        name,
        email,
      ];
}
