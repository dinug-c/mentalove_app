import 'package:flutter/material.dart';

import '../shared/theme.dart';
import '../widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class BayarDisini extends StatefulWidget {
  const BayarDisini({super.key});

  @override
  State<BayarDisini> createState() => _BayarDisiniState();
}

@override
Future<void> _openBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw 'Could not launch $url';
  }
}

class _BayarDisiniState extends State<BayarDisini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarCustom(
            title: 'Pembayaran Berhasil',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
            leftAction: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            size: 120,
                            color: kGreenColor,
                          ),
                          Text(
                            "Selamat Permintaanmu telah Masuk!",
                            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),textAlign: TextAlign.center,
                          ),
                          Text(
                            "Silakan lakukan pembayaran agar kami dapat memproses lebih lanjut pesananmu!",
                            style: blackTextStyle.copyWith(fontSize: 14), textAlign: TextAlign.center,
                          ),
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPurpleColor,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onPressed: () {
                              _openBrowser('https://app.sandbox.midtrans.com/payment-links/1694709868325'); // Replace with your URL
                            },
                            child: Text('Bayar Disini',
                            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),),
                            ),
                            
                        )
              ]
            ),

            )
        ]
      )
    );
  }
}

