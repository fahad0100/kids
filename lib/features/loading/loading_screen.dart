import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinder_app/core/locator/get_it_instant.dart';
import 'package:kinder_app/core/routes/base_route.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
