import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  String text =
      'Aplikasi Layanan Jasa Kesehatan Mental pertama yang fokus terhadap pengembangan Regulasi Diri. Aplikasi ini berbasis Mobile App yang dapat didownload melalui Playstore. Biaya yang terjangkau serta fitur yang menunjang adalah keunggulan kami. Mentalove akan membantu teman-teman untuk mencapai goals yang diinginkan.';

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
            title: 'About Us',
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
                  child: const Image(
                    image: AssetImage('assets/logo_1024.png'),
                    width: 200,
                    height: 200,
                  ),
                ),
                Center(
                  child: Text(
                    'Mentalove',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: extraBold),
                  ),
                ),
                gapH24,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text(
                    text,
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,
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
