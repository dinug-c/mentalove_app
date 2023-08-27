import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

class PsikiaterPage extends StatefulWidget {
  const PsikiaterPage({super.key});

  @override
  State<PsikiaterPage> createState() => _PsikiaterPageState();
}

class _PsikiaterPageState extends State<PsikiaterPage> {
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
            title: 'Psikiater',
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
                const PsikologCard(
                  image: AssetImage('assets/detail_pfp.png'),
                  name: 'Aris Prabowo Wijayanto',
                  position: 'Psikologi Klinis',
                  expertise: 'Depresi, Trauma, Pekerjaan',
                  price: 'Rp 40.000 - Rp 45.000',
                  workPeriod: '2 tahun',
                  rating: '97%',
                ),
                const PsikologCard(
                  image: AssetImage('assets/detail_pfp.png'),
                  name: 'Aris Prabowo Wijayanto',
                  position: 'Psikologi Klinis',
                  expertise: 'Depresi, Trauma, Pekerjaan',
                  price: 'Rp 40.000 - Rp 45.000',
                  workPeriod: '2 tahun',
                  rating: '97%',
                ),
                const PsikologCard(
                  image: AssetImage('assets/detail_pfp.png'),
                  name: 'Aris Prabowo Wijayanto',
                  position: 'Psikologi Klinis',
                  expertise: 'Depresi, Trauma, Pekerjaan',
                  price: 'Rp 40.000 - Rp 45.000',
                  workPeriod: '2 tahun',
                  rating: '97%',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}