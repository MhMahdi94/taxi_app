import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_application/layout/appLayout.dart';
import 'package:taxi_application/modules/auth/auth_page.dart';
import 'package:taxi_application/modules/auth/cubit/cubit.dart';
import 'package:taxi_application/modules/splash/splash_screen.dart';
import 'package:taxi_application/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late Widget startWidget;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      startWidget = AuthPage();
    } else {
      print('User is signed in!');
      startWidget = AppLayout();
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Taxi App',
            // You can use the library anywhere in the app even in theme
            theme: appTheme,
            home: child,
          );
        },
        child: SplashScreen(
          startWidget: startWidget,
        ),
      ),
    );
  }
}
