import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
        backgroundColor: kWhiteColor,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/bg_login.png',
                    ),
                    fit: BoxFit.cover)),
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: SizedBox()),

                  //Logo
                  const Expanded(
                      flex: 0,
                      child: Image(
                        image: AssetImage('assets/logo_text_small.png'),
                      )),

                  //TextField Email
                  const Expanded(
                    flex: 0,
                    child: NewForm(
                        nama: "Email",
                        hintText: "Masukkan Email",
                        obscureText: false,
                        topPadding: 10,
                        bottomPadding: 5,
                        horizontalPadding: 25),
                  ),

                  //TextField Password
                  const Expanded(
                    flex: 0,
                    child: NewForm(
                        nama: "Password",
                        hintText: "Masukkan Password",
                        obscureText: true,
                        topPadding: 5,
                        bottomPadding: 10,
                        horizontalPadding: 25),
                  ),

                  Expanded(
                      flex: 1,
                      child: Container(
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
                                  Navigator.pushNamed(context, '/tellus');
                                })
                          ],
                        ),
                      )),

                  RichText(
                      text: TextSpan(
                          style: blackTextStyle.copyWith(color: Colors.black),
                          children: <TextSpan>[
                        const TextSpan(text: "Belum punya akun? "),
                        TextSpan(
                            text: "Daftar di sini",
                            style: blackTextStyle.copyWith(color: kPrimary2Color),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(context, '/signup-page');
                              })
                      ])),
                ])));
  }
}
