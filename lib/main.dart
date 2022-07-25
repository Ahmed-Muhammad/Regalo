import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mercado/src/core/themes/app_theme.dart';

import 'src/core/bloc_observer/bloc_observer.dart';
import 'src/features/splash_screen/screens/splash_screen.dart';

void main() {
  //Bloc Observer.
  BlocOverrides.runZoned(
    () => runApp(const MercadoApp()),
    blocObserver: MyBlocObserver(),
  );
  runApp(const MercadoApp());
}

class MercadoApp extends StatelessWidget {
  const MercadoApp({Key? key}) : super(key: key);

//ss
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
