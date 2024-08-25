import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/ui/space_ui.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
              child: SizedBox(
                height: 250,
                child: Column(
                  children: [
                    const Text(
                      'Profile',
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
