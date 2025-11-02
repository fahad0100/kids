import 'package:go_router/go_router.dart';
import 'package:kinder_app/screens/home/home_screen.dart';
import 'package:kinder_app/screens/loading/loading_screen.dart';
import 'package:kinder_app/screens/login/login_screen.dart';
import 'package:kinder_app/screens/sign_up/sign_up_screen.dart';

abstract class Routes {
  static String init = '/';
  static String login = '/login';
  static String signUp = '/signUp';
  static String home = '/home';
  static String loadingScreen = '/loading';

  static final routers = GoRouter(
    initialLocation: init,
    routes: [
      GoRoute(
        path: init,
        builder: (context, state) {
          Future.delayed(Duration(seconds: 3), () {
            if (context.mounted) {
              context.go(signUp);
            }
          });
          return LoadingScreen();
        },
      ),
      GoRoute(path: login, builder: (context, state) => LoginScreen()),
      GoRoute(path: signUp, builder: (context, state) => SignUpScreen()),
      GoRoute(path: home, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: loadingScreen,
        builder: (context, state) => LoadingScreen(),
      ),
    ],
  );
}
