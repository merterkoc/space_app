import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/ui/space_ui.dart';
import 'package:space_app/src/util/extensions/theme_extension.dart';

enum SignInViewSegments { login, register }

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  SignInViewSegments _selectedSegment = SignInViewSegments.login;

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
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listenWhen: (previous, current) =>
            previous.loginResponse?.status != current.loginResponse?.status ||
            previous.registerResponse?.status !=
                current.registerResponse?.status,
        listener: (context, state) {
          if (state.loginResponse?.status.isError == true) {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Error'),
                content: Text(state.loginResponse!.message!),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('Tamam'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
          } else if (state.registerResponse?.status.isError == true) {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Hata'),
                content: Text(state.registerResponse!.message!),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('Tamam'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
              CupertinoSlidingSegmentedControl<SignInViewSegments>(
                // This represents the currently selected segmented control.
                groupValue: _selectedSegment,
                // Callback that sets the selected segmented control.
                onValueChanged: (SignInViewSegments? value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  }
                },
                children: const <SignInViewSegments, Widget>{
                  SignInViewSegments.login: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SignInViewSegments.register: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                },
              ),
                  const SizedBox(height: 20),
                  _selectedSegment == SignInViewSegments.login
                      ? loginForm(context)
                      : registerForm(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form registerForm(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SpaceCupertinoTextField(
            icon: CupertinoIcons.person,
            placeholder: 'Name',
            controller: _nameController,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 20),
          SpaceCupertinoTextField(
            icon: CupertinoIcons.mail,
            placeholder: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          SpaceCupertinoTextField(
            icon: CupertinoIcons.lock_circle,
            placeholder: 'Password',
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          SpaceCupertinoTextField(
            icon: CupertinoIcons.lock_circle,
            placeholder: 'Password',
            controller: _confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            buildWhen: (previous, current) =>
                previous.registerResponse != current.registerResponse,
            builder: (context, state) {
              return CupertinoButton.filled(
                onPressed: () {
                  if (state.registerResponse?.status.isLoading == true) {
                    return;
                  }
                  context.read<AuthenticationBloc>().add(
                        SignUpRequested(
                          email: _nameController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text,
                          name: _emailController.text,
                        ),
                      );
                },
                child: state.registerResponse?.status.isLoading == true
                    ? CupertinoActivityIndicator(
                        color: context.myThemeColors.secondaryColor)
                    : const Text('Register'),
              );
            },
          ),
        ],
      ),
    );
  }

  Form loginForm(BuildContext context) {
    return Form(
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
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            buildWhen: (previous, current) =>
                previous.loginResponse != current.loginResponse,
            builder: (context, state) {
              return CupertinoButton.filled(
                onPressed: () {
                  if (state.loginResponse?.status.isLoading == true) {
                    return;
                  }
                  context.read<AuthenticationBloc>().add(
                        SignInRequested(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                },
                child: state.loginResponse?.status.isLoading == true
                    ? CupertinoActivityIndicator(
                        color: context.myThemeColors.secondaryColor)
                    : const Text('Login'),
              );
            },
          ),
        ],
      ),
    );
  }
}
