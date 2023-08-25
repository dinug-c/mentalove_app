import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

import '../widgets/button.dart';

class PsikologPage extends StatefulWidget {
  const PsikologPage({super.key});

  @override
  State<PsikologPage> createState() => _PsikologPageState();
}

class _PsikologPageState extends State<PsikologPage> {
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
            title: 'Psikolog',
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 150,
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
                                  fontSize: 15, fontWeight: extraBold),
                            ),
                            Text(
                              'Psikologi Klinis',
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: extraBold),
                            ),
                            Text(
                              'Depresi, Trauma, Pekerjaan',
                              style: blackTextStyle.copyWith(fontSize: 12),
                            ),
                            gapH32,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Rp 40.000 - Rp. 45.000',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 12, fontWeight: extraBold)),
                                gapW64,
                                Text('2 Tahun',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 12, fontWeight: extraBold))
                              ],
                            ),
                            gapW12,
                            Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 40,
                                  child: Button(
                                      text: "Jadwalkan",
                                      textColor: kWhiteColor,
                                      startColor: kPurpleColor,
                                      endColor: kPurpleColor,
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/detail');
                                      }),
                                ),
                                gapW8,
                                Container(
                                  width: 50,
                                  height: 40,
                                  child: Button(
                                      text: "97%",
                                      textColor: kPurpleColor,
                                      startColor: kPrimaryLightColor,
                                      endColor: kPrimaryLightColor,
                                      onPressed: () {
                                        //Navigator.pushNamed(context, '/detail');
                                      }),
                                ),
                              ],
                            )
                          ])
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
