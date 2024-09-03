part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserInfoDTO? userInfo;
  final String? errorMessage;

  const UserState({this.userInfo, this.errorMessage});

  const UserState.initial() : this(userInfo: null);

  const UserState.loading(UserInfoDTO? userInfo) : this(userInfo: userInfo);

  const UserState.error(String? errorMessage)
      : this(errorMessage: errorMessage);

  const UserState.success(UserInfoDTO userInfo) : this(userInfo: userInfo);

  @override
  List<Object?> get props => [
        userInfo,
      ];
}
