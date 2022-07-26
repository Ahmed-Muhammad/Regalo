import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regalo/src/features/restore_password/controller/bloc/restore_password_cubit.dart';
import 'package:regalo/src/features/splash_screen/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/core/api/dio_helper.dart';
import 'src/core/bloc_observer/bloc_observer.dart';
import 'src/core/themes/app_theme.dart';
import 'src/features/home_page/controller/bloc/main_cubit.dart';
import 'src/features/home_page/screens/product_page.dart';
import 'src/features/login_page/controller/cubit/login_cubit.dart';
import 'src/features/register_page/controller/cubit/register_cubit.dart';

void main() async {
  //ensure every thing is Initialized then Run App
  WidgetsFlutterBinding.ensureInitialized();
  //local notification Initialized
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'key1',
        channelName: 'verification code',
        channelDescription: 'verification code',
        importance: NotificationImportance.Max,
        playSound: true,
        enableVibration: true,
      )
    ],
  );
  // ---------- Dio Initialization ------------
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    // DevicePreview(
    //   builder: (context) => const RegaloApp(),
    // ),
    const RegaloApp(),
  );
}

class RegaloApp extends StatelessWidget {
  const RegaloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => MainCubit()..getProductsDetails(),
        ),
        BlocProvider(
          create: (context) => RestorePasswordCubit(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''), // Arabic
        ],
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: appTheme,
        home:  const SplashScreen(),
      ),
    );
  }
}
