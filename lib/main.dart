import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentalove_app/ui/pages/chat_page.dart';
import 'package:mentalove_app/ui/pages/counseling.dart';
import 'package:mentalove_app/ui/pages/daily_content.dart';
import 'package:mentalove_app/ui/pages/detail.dart';
import 'package:mentalove_app/ui/pages/history.dart';
import 'package:mentalove_app/ui/pages/landing_page.dart';
import 'package:mentalove_app/ui/pages/login_page.dart';
import 'package:mentalove_app/ui/pages/main_page.dart';
import 'package:mentalove_app/ui/pages/psikiater_page.dart';
import 'package:mentalove_app/ui/pages/psikolog_page.dart';
import 'package:mentalove_app/ui/pages/signup_page.dart';
import 'package:mentalove_app/ui/pages/tell_us.dart';
import 'package:mentalove_app/ui/pages/pembayaran.dart';

import 'cubit/page_cubit.dart';
import 'ui/pages/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bggdwohgbcrkzkwnmsoa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJnZ2R3b2hnYmNya3prd25tc29hIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM4MzM3MjAsImV4cCI6MjAwOTQwOTcyMH0.VHxvpnB9WhYIvvZTCoivBdCXt1t9LXsj3XLVvfIoyOA',
    authFlowType: AuthFlowType.pkce,
  );

  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => const SplashScreen(),
        '/main-page': (context) => const MainPage(),
        '/landing-page': (context) => const LandingPage(),
        '/counseling': (context) => const Counseling(),
        '/login-page': (context) => const LoginPage(),
        '/signup-page': (context) => const SignupPage(),
        '/detail': (context) => const Detail(
              terapisData: {},
            ),
        '/history': (context) => const HistoryPage(),
        '/daily': (context) => const DailyContentPage(),
        '/tellus': (context) => const TellUsPage(),
        '/psikolog-page': (context) => const PsikologPage(),
        '/pembayaran': (context) =>
            const Pembayaran(terapisData: {}, mode: true),
        '/psikiater-page': (context) => const PsikiaterPage(),
        '/chat-page': (context) => const ChatPage(),
      }),
    );
  }
}
