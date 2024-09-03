import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/bloc/user_bloc/user_bloc.dart';
import 'package:space_app/src/feature/home/home_view.dart';
import 'package:space_app/src/ui/space_ui.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  initState() {
    context.read<UserBloc>().add(const GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Geri',
        middle: Text('Profile'),
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SafeArea(
              bottom: false,

              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProfileIcon(
                      width: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name: ${context.watch<UserBloc>().state.userInfo?.name}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Email: ${context.watch<UserBloc>().state.userInfo?.email}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CupertinoButton(
                        child: const Text('Logout'),
                        onPressed: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(LogoutRequested());
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
