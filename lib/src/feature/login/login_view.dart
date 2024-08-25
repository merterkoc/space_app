import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/ui/space_ui.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: const CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        previousPageTitle: 'Geri',
        middle: Text('Login'),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    child: Column(
                      children: <Widget>[
                        SpaceCupertinoTextField(
                          icon: CupertinoIcons.mail,
                          placeholder: 'Email',
                          controller: _emailController,
                        ),
                        const SizedBox(height: 20),
                        SpaceCupertinoTextField(
                          icon: CupertinoIcons.lock_circle,
                          placeholder: 'Password',
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 20),
                        CupertinoButton.filled(
                          onPressed: () {
                            context.read<AuthenticationBloc>().add(
                                  SignInRequested(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        SpaceCupertinoTextField(
                          icon: CupertinoIcons.person,
                          placeholder: 'Name',
                          controller: _nameController,
                        ),
                        const SizedBox(height: 20),
                        SpaceCupertinoTextField(
                          icon: CupertinoIcons.mail,
                          placeholder: 'Email',
                          controller: _emailController,
                        ),
                        const SizedBox(height: 20),
                        SpaceCupertinoTextField(
                          icon: CupertinoIcons.lock_circle,
                          placeholder: 'Password',
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 20),
                        SpaceCupertinoTextField(
                          icon: CupertinoIcons.lock_circle,
                          placeholder: 'Password',
                          controller: _confirmPasswordController,
                        ),
                        const SizedBox(height: 20),
                        CupertinoButton.filled(
                          onPressed: () {
                            context.read<AuthenticationBloc>().add(
                                  SignUpRequested(
                                    email: _nameController.text,
                                    password: _passwordController.text,
                                    name: _emailController.text,
                                  ),
                                );
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
