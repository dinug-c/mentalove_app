import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

import '../shared/theme.dart';
import '../widgets/appbar.dart';

class TellUsPage extends StatefulWidget {
  const TellUsPage({super.key});

  @override
  State<TellUsPage> createState() => _TellUsPageState();
}

class _TellUsPageState extends State<TellUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightGreyColor,
        body: CustomScrollView(slivers: <Widget>[
          AppBarCustom(
            title: 'Tell Us',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
            // leftIcon: Icons.menu,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            TellUsCard(
              name: 'Susanto',
              date: '28 Juni 2023',
              desc:
                  'Tadi pacarku marah sama aku gara-gara aku ga beliin cilok, mau tanya dong guys solusinya aku harus gimana ya, soalnya',
              profil: const AssetImage('assets/default_pfp.png'),
              onTap: () {},
            ),
            gapH12,
            TellUsCard(
              name: 'Susanti',
              date: '28 Juni 2023',
              desc:
                  'Akhirnya  setelah 5 taun berjuang sendirian cari duit buat lunasin utang suami, aku bisa lunasin utangnyaa hari iniii. Jadi',
              profil: const AssetImage('assets/default_pfp.png'),
              onTap: () {},
              image: const AssetImage('assets/kons-tapmuk.png'),
            ),
            gapH12,
            TellUsCard(
              name: 'Evelyn',
              date: '28 Juni 2023',
              desc:
                  'doiku ga peka, padal udah kukodein berkali kali tapi masih aja tarik ulur gimana ya caranya',
              profil: const AssetImage('assets/default_pfp.png'),
              onTap: () {},
            )
          ]))
        ]));
  }
}
