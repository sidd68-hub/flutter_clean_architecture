import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injector.dart';
import 'package:flutter_clean_architecture/core/extension/localization_extension.dart';
import 'package:flutter_clean_architecture/presentation/bloc/locale/language_bloc.dart';
import 'package:flutter_clean_architecture/presentation/bloc/locale/language_event.dart';
import 'package:flutter_clean_architecture/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_clean_architecture/presentation/screen/login/bloc/login_event.dart';
import 'package:flutter_clean_architecture/presentation/screen/login/bloc/login_state.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginPressed() {
    final email = _emailController.text;
    final password = _passwordController.text;
    context.read<LoginBloc>().add(LoginButtonPressed(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.goodbye)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go('/home');
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state is LoginLoading ? null : _onLoginPressed,
                  child: state is LoginLoading
                      ? const CircularProgressIndicator()
                      : const Text("Login"),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => showLanguageBottomSheet(context),
                  child: const Text("Don't have an account? Sign up"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: (){
                    sl<LocaleBloc>().add(ChangeLocale(Locale('en')));
                    Navigator.pop(context);
                  },
                  child: Text("English", style: TextStyle(fontSize: 16))),
              SizedBox(height: 12),
              GestureDetector(
                  onTap: (){
                    sl<LocaleBloc>().add(ChangeLocale(Locale('hi')));
                    Navigator.pop(context);
                  },
                  child: Text("Hindi", style: TextStyle(fontSize: 16))),
            ],
          ),
        );
      },
    );
  }

}
