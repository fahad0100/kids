import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kinder_app/features/authentication/domain/usecases/auth_use_case.dart';
import 'package:kinder_app/features/authentication/presentation/cubit/authentication_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthenticationCubit(authUseCase: GetIt.I.get<AuthUseCase>()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AuthenticationCubit>();
          return ElevatedButton(
            onPressed: () async {
              await cubit.createAccount(
                name: "fahad alazmi",
                email: email,
                type: "user",
              );
            },
            child: Text("Login"),
          );
        },
      ),
    );
  }
}
