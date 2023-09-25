import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';

import '../../services/auth.dart';
import '../shared/gaps.dart';
import '../shared/theme.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class LoginPsikolog extends StatefulWidget {
  const LoginPsikolog({super.key});

  @override
  State<LoginPsikolog> createState() => _LoginPsikologState();
}

class _LoginPsikologState extends State<LoginPsikolog> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                    Center(
                      child: Text(
                        "Masuk Sebagai Psikolog",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold),
                      ),
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

                    NewForm(
                        nama: "Kode",
                        hintText: "Masukan Kode Psikolog",
                        controller: _kodeController,
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
                                if (_kodeController.text.trim() == "Psiko14") {
                                  psikologLogin(
                                      context,
                                      _emailController.text.trim(),
                                      _passwordController.text.trim());
                                } else {
                                  showToast(context, "Kode Psikolog Salah");
                                }
                              })
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
