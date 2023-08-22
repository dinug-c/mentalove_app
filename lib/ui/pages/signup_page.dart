import 'package:appwrite/appwrite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/textfield.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';

import '../../services/appwrite_client.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

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
                        controller: emailController,
                        hintText: "Masukkan Email",
                        obscureText: false,
                        horizontalPadding: 25),
                    gapH8,

                    //TextField Password,
                    NewForm(
                        nama: "Password",
                        controller: passwordController,
                        hintText: "Masukkan Password",
                        obscureText: true,
                        horizontalPadding: 25),
                    gapH8,

                    NewForm(
                        nama: "Konfirmasi Password",
                        controller: passwordConfirmationController,
                        hintText: "Masukkan Konfirmasi Password",
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
                              text: "Daftar",
                              textColor: kWhiteColor,
                              startColor: kPrimaryColor,
                              endColor: kPrimary2Color,
                              onPressed: () async {
                                try {
                                  final user = await account.create(
                                    userId: ID.unique(),
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  user.status
                                      ? Navigator.pushReplacementNamed(
                                          context, '/main-page')
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: const Text(
                                              'Terjadi kesalahan, silahkan coba lagi'),
                                          backgroundColor: kPrimaryColor,
                                        ));
                                } catch (e) {
                                  showToast(context, e.toString());
                                }
                              })
                        ],
                      ),
                    ),

                    gapH12,
                    RichText(
                        text: TextSpan(
                            style: blackTextStyle.copyWith(color: Colors.black),
                            children: <TextSpan>[
                          const TextSpan(text: "Sudah punya akun? "),
                          TextSpan(
                              text: "Masuk di sini",
                              style: blackTextStyle.copyWith(
                                  color: kPrimary2Color),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login-page');
                                })
                        ])),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
