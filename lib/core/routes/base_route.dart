import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kinder_app/features/auth/bloc/auth_bloc.dart';
import 'package:kinder_app/features/auth/screens/otp_screen.dart';
import 'package:kinder_app/features/home/home_screen.dart';
import 'package:kinder_app/features/loading/loading_screen.dart';
import 'package:kinder_app/features/auth/screens/login_screen.dart';
import 'package:kinder_app/features/auth/screens/sign_up_screen.dart';

abstract class Routes {
  static String init = '/';
  static String login = '/login';
  static String signUp = '/signUp';
  static String home = '/home';
  static String loadingScreen = '/loading';
  static String otpScreen = '/otp';

  static final routers = GoRouter(
    initialLocation: init,
    routes: [
      GoRoute(
        path: init,
        builder: (context, state) {
          Future.delayed(Duration(seconds: 3), () {
            if (context.mounted) {
              context.go(login);
            }
          });
          return LoadingScreen();
        },
      ),
      GoRoute(path: login, builder: (context, state) => LoginScreen()),
      GoRoute(
        path: signUp,
        builder: (context, state) => BlocProvider.value(
          value: state.extra as AuthBloc,
          child: SignUpScreen(),
        ),
      ),
      GoRoute(path: home, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: otpScreen,
        builder: (context, state) {
          return BlocProvider.value(
            value: state.extra as AuthBloc,
            child: OTPScreen(),
          );
        },
      ),
      GoRoute(
        path: loadingScreen,
        builder: (context, state) => LoadingScreen(),
      ),
    ],
  );
}
