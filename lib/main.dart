import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mercado/src/core/themes/app_theme.dart';

import 'src/core/bloc_observer/bloc_observer.dart';
import 'src/features/splash_screen/screens/splash_screen.dart';

void main() {
  //Bloc Observer
  BlocOverrides.runZoned(
    () => runApp(const MercadoApp()),
    blocObserver: MyBlocObserver(),
  );
  runApp(
    DevicePreview(
      builder: (context) => const MercadoApp(),
    ),
  );
}

class MercadoApp extends StatelessWidget {
  const MercadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: appTheme,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
