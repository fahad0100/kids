import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinder_app/locator/get_it_instant.dart';
import 'package:kinder_app/routes/base_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InstantGetIt.setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        InstantGetIt.boxStorage.saveLocal(key: "key", dataSave: "dataSave");
        return MaterialApp.router(routerConfig: Routes.routers);
      },
    );
  }
}

//
