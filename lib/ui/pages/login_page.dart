import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/services/auth.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/textfield.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // ignore: unused_field
  late final StreamSubscription<AuthState> _authStateSubscription;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        Navigator.of(context).pushReplacementNamed('/main-page');
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/bg_login.png',
                  ),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),

                    //Logo
                    const Image(
                      image: AssetImage('assets/logo_text_small.png'),
                    ),

                    //TextField Email
                    NewForm(
                        nama: "Email",
                        hintText: "Masukkan Email",
                        controller: _emailController,
                        obscureText: false,
                        horizontalPadding: 25),
                    gapH8,

                    //TextField Password,
                    NewForm(
                        nama: "Password",
                        hintText: "Masukkan Password",
                        controller: _passwordController,
                        obscureText: true,
                        horizontalPadding: 25),
                    gapH8,

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Button(
                              text: "Masuk",
                              textColor: kWhiteColor,
                              startColor: kPrimaryColor,
                              endColor: kPrimary2Color,
                              onPressed: () {
                                authLogin(context, _emailController.text.trim(),
                                    _passwordController.text.trim());
                              })
                        ],
                      ),
                    ),

                    gapH12,
                    RichText(
                        text: TextSpan(
                            style: blackTextStyle.copyWith(color: Colors.black),
                            children: <TextSpan>[
                          const TextSpan(text: "Belum punya akun? "),
                          TextSpan(
                              text: "Daftar di sini",
                              style: blackTextStyle.copyWith(
                                  color: kPrimary2Color),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signup-page');
                                })
                        ])),
                    gapH12,
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Masuk sebagai Psikolog",
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
