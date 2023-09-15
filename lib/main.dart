import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mentalove_app/ui/pages/chat_page.dart';
import 'package:mentalove_app/ui/pages/counseling.dart';
import 'package:mentalove_app/ui/pages/daily_content.dart';
import 'package:mentalove_app/ui/pages/detail.dart';
import 'package:mentalove_app/ui/pages/history.dart';
import 'package:mentalove_app/ui/pages/history_order.dart';
import 'package:mentalove_app/ui/pages/landing_page.dart';
import 'package:mentalove_app/ui/pages/login_page.dart';
import 'package:mentalove_app/ui/pages/login_psikolog.dart';
import 'package:mentalove_app/ui/pages/main_page.dart';

import 'package:mentalove_app/ui/pages/pembayaran.dart';
import 'package:mentalove_app/ui/pages/psikiater_page.dart';
import 'package:mentalove_app/ui/pages/psikolog_page.dart';
import 'package:mentalove_app/ui/pages/signup_page.dart';
import 'package:mentalove_app/ui/pages/tell_us.dart';
import 'package:mentalove_app/ui/pages/terapis_history.dart';
import 'package:mentalove_app/ui/pages/terapis_main.dart';
import 'package:mentalove_app/ui/pages/total_pendapatan.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'cubit/page_cubit.dart';
import 'ui/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(
    url: 'https://bggdwohgbcrkzkwnmsoa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJnZ2R3b2hnYmNya3prd25tc29hIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM4MzM3MjAsImV4cCI6MjAwOTQwOTcyMH0.VHxvpnB9WhYIvvZTCoivBdCXt1t9LXsj3XLVvfIoyOA',
    authFlowType: AuthFlowType.pkce,
  );

  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
        '/pembayaran': (context) => const Pembayaran(
              terapisData: {},
              mode: true,
              selectedJam: 0,
              selectedTanggal: 0,
            ),
        '/psikiater-page': (context) => const PsikiaterPage(),
        '/chat-page': (context) => const ChatPage(),
        '/history-order': (context) => const HistoryOrder(),
        '/terapis-main': (context) => const TerapisMainPage(),
        '/terapis-history': (context) => const TerapisHistory(),
        '/login-psikolog': (context) => const LoginPsikolog(),
        '/total-pendapatan': (context) => const TotalPendapatan()
      }),
    );
  }
}
