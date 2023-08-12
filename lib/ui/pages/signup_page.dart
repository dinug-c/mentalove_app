import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    dynamic parentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          child: Container(
              width: parentWidth,
              height: parentWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/bg_login.png',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox()),
        
                    //Logo
                    const Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/logo_text_small.png'),
                        )),
        
                    //TextField Email
                    const Expanded(
                      flex: 1,
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
                      flex: 1,
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
        
                    RichText(
                        text: TextSpan(
                            style: blackTextStyle.copyWith(color: Colors.black),
                            children: <TextSpan>[
                          const TextSpan(text: "Sudah punya akun? "),
                          TextSpan(
                              text: "Masuk di sini",
                              style: blackTextStyle.copyWith(color: kPrimary2Color),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(context, '/login-page');
                                })
                        ])),
                  ])),
        ));
  }
}
