import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/bloc_observer/bloc_observer.dart';
import 'src/core/themes/app_theme.dart';
import 'src/features/home_page/controller/bloc/main_cubit.dart';
import 'src/features/login_page/controller/cubit/login_cubit.dart';
import 'src/features/login_page/screens/login_page.dart';
import 'src/features/register_page/controller/cubit/register_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ), BlocProvider(
          create: (context) => MainCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: appTheme,
        home: const LoginPage(),
      ),
    );
  }
}
