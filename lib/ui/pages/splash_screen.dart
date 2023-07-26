import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mentalove_app/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      // var user = false;
      // if(user == null){
      //   Navigator.pushNamedAndRemoveUntil(context, '/get-started', (route) => false);
      // } else {
      //   context.read<AuthCubit>().getCurrentUser(user.uid);
      //   Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      // }
      Navigator.pushNamedAndRemoveUntil(
          context, '/landing-page', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic parentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: parentWidth / 3,
            height: parentWidth / 3,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/logo.png'),
            )),
          ),
          Text(
            'Mentalove',
            style: blackTextStyle.copyWith(
                fontSize: 32, fontWeight: extraBold, letterSpacing: 3),
          )
        ]),
      ),
    );
  }
}
