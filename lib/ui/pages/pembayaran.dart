import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    );

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarCustom(
            title: 'Pembayaran',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: kPrimary2Color,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                image: const DecorationImage(
                                    image: AssetImage('assets/detail_pfp.png'),
                                    fit: BoxFit.cover)),
                          ),
                          gapW12,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aris Prabowo Wijayanto',
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: extraBold),
                              ),
                              Text('Psikologi Klinis',
                                  style: blackTextStyle.copyWith(fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                      gapH24,
                      Text('Jadwal',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: extraBold)),
                      gapH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0, color: kPurpleColor),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13.0),
                                    backgroundColor: kPurpleColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chat,
                                      color: kWhiteColor,
                                    ),
                                    gapW12,
                                    Text(
                                      'Chat',
                                      style: blackTextStyle.copyWith(
                                          color: kWhiteColor, fontWeight: bold),
                                    ),
                                  ],
                                )),
                          ),
                          gapW12,
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0, color: kPurpleColor),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13.0),
                                    backgroundColor: kWhiteColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person_pin_rounded,
                                        color: kPurpleColor),
                                    gapW12,
                                    Text('Video Call',
                                        style: blackTextStyle.copyWith(
                                            color: kPurpleColor,
                                            fontWeight: bold)),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: kPurpleColor, width: 1.0))),
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            gapH8,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rp. 40.000,00',
                      style: blackTextStyle.copyWith(fontWeight: extraBold))
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  //padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Button(
                          text: "Bayar Sekarang",
                          textColor: kPurpleColor,
                          startColor: kPrimaryLightColor,
                          endColor: kPrimaryLightColor,
                          onPressed: () {
                            //Navigator.pushNamed(context, '/pembayaran');
                          })
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
