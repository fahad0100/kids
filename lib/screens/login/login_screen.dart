import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinder_app/routes/base_route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            context.push(Routes.signUp);
          },
          child: Text("Move Sign Up Screen"),
        ),
      ),
    );
  }
}
