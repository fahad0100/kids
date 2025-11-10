import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kinder_app/features/authentication/presentation/pages/login_screen.dart';

import 'package:kinder_app/features/home/home_screen.dart';
import 'package:kinder_app/features/loading/loading_screen.dart';

abstract class Routes {
  static String init = '/';
  static String login = '/login';
  static String signUp = '/signUp';
  static String home = '/home';
  static String otpScreen = '/otp';

  static final routers = GoRouter(
    initialLocation: init,
    routes: [
      GoRoute(
        path: init,
        builder: (context, state) {
          // Future.delayed(Duration(seconds: 3), () {
          //   if (context.mounted) {
          //     context.go(login);
          //   }
          // });
          return HomeScreen();
        },
      ),

      //------//
      //------//
      //------//
      //------//

      //------//
      //------//
      //------//
      //------//
      GoRoute(path: home, builder: (context, state) => HomeScreen()),
      //------//
      //------//
      //------//
      //------//

      //------//
      //------//
      //------//
      //------//
    ],
  );
}
