import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

class Counseling extends StatefulWidget {
  const Counseling({super.key});

  @override
  State<Counseling> createState() => _CounselingState();
}

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
            // leftAction: () {},
            // leftIcon: Icons.menu,
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
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/chat-psikologi');
                          },
                          icon: const Icon(Icons.chat),
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
