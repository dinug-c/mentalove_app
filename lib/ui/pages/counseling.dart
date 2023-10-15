import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:url_launcher/url_launcher.dart';

class Counseling extends StatefulWidget {
  const Counseling({super.key});

  @override
  State<Counseling> createState() => _CounselingState();
}

// @override
// Future<void> _openBrowser(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url, forceSafariVC: true, forceWebView: true);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

class _CounselingState extends State<Counseling> {
  @override
  void initState() {
    super.initState();
  }

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
            title: 'Counseling',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Setiap Ahli Punya Keunggulan Masing-Masing',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: extraBold),
                        ),
                        Text(
                          'Tentukan ahli yang sesuai dengan keluhanmu agar penanganan yang dilakukan dapat maksimal!',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ),
                        gapH12,
                        CardAhli(
                          title: 'Psikolog',
                          desc:
                              'Membantumu dalam melakukan asesmen kesehatan mental dan konsultasi.',
                          image: const AssetImage('assets/icon_psiko.png'),
                          onTap: () {
                            Navigator.pushNamed(context, '/psikolog-page');
                          },
                        ),
                        gapH12,
                        CardAhli(
                          title: 'Psikiater',
                          desc:
                              'Membantumu dalam melakukan penanganan lebih lanjut dan memberikan terapi pengobatan.',
                          image: const AssetImage('assets/icon_psiki.png'),
                          onTap: () {
                            Navigator.pushNamed(context, '/psikiater-page');
                          },
                        ),
                        gapH12,
                        Text(
                          'History Order',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: extraBold),
                        ),
                        Text(
                          'Cek pesananmu disini!',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ),
                        gapH12,
                        CardAhli(
                          title: 'Lihat History Order',
                          desc:
                              'Membantumu dalam melakukan penanganan lebih lanjut dan memberikan terapi pengobatan.',
                          image: const AssetImage('assets/icon_schedule.png'),
                          onTap: () {
                            Navigator.pushNamed(context, '/history-order');
                          },
                        ),
                        gapH12,
                        Text(
                          'Tuliskan Perasaanmu Disini',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: extraBold),
                        ),
                        Text(
                          'Kami siap mendengarkan keluh kesahmu!',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ),
                        gapH12,
                        CardAhli(
                          title: 'Self Report Mentalove',
                          desc:
                              'Apa yang kamu rasakan saat ini? Tuangkan ceritamu disini.',
                          image: const AssetImage('assets/ic_pencil.png'),
                          onTap: () async {
                            Uri url = Uri.parse(
                                "https://forms.gle/MHpA6LnHBdxdCsLM6");

                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            } else {
                              launchUrl(url);
                            }
                          },
                        ),
                      ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
