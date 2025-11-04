import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinder_app/core/routes/base_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go(Routes.login);
          },
          child: Text("HomeScreen"),
        ),
      ),
    );
  }
}
