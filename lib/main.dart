import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentalove_app/ui/pages/landing_page.dart';
import 'ui/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const SplashScreen(),
      '/landing-page': (context) => const LandingPage(),
    });

    // MultiBlocProvider(
    //   providers: [],
    //   child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
    //     '/': (context) => const SplashScreen(),
    //     '/landing-page': (context) => const LandingPage(),
    //   }),
    // );
  }
}
