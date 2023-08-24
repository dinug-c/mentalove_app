import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LandingPage> {
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
                    'assets/bg.png',
                  ),
                  fit: BoxFit.cover)),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              const Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage('assets/logo_text.png'),
                ),
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
                              Navigator.pushNamed(context, '/login-page');
                            }),
                        gapH(21),
                        ButtonOutline(
                            text: "Daftar",
                            textColor: kPrimary2Color,
                            borderColor: kPrimaryColor,
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup-page');
                            }),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
