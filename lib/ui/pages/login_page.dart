import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/button.dart';

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
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 1,
                      child: Image(
                        image: AssetImage('assets/logo_text_small.png'),
                      )),

                  Expanded(flex: 1, child: Container(
                    child: Column(
                      children: [
                        Text("Email"),
                        Text("Password")
                      ],
                    ),
                  )),
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
                                      Navigator.pushNamed(
                                          context, '/counseling');
                                    })
                                ],
                            ),
                          ))
                ])));
  }
}
