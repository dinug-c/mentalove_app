import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
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

                  //TextField Konfirmasi Password
                  const Expanded(
                    flex: 0,
                    child: NewForm(
                        nama: "Konfirmasi Password",
                        hintText: "Masukkan konfirmasi password",
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
                                text: "Daftar",
                                textColor: kWhiteColor,
                                startColor: kPrimaryColor,
                                endColor: kPrimary2Color,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/counseling');
                                })
                          ],
                        ),
                      )),

                  Container(
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(text: "Sudah punya akun? "),
                            TextSpan(
                                text: "Masuk di sini",
                                style: TextStyle(color: kPrimary2Color),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(context, '/login-page');
                                  })
                          ])),
                  ),
                ])));
  }
}
