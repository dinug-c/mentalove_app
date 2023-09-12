import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/pages/detail.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

import '../widgets/card.dart';
import '../widgets/toast.dart';

class TerapisHistory extends StatefulWidget {
  const TerapisHistory({super.key});

  @override
  State<TerapisHistory> createState() => _TerapisHistoryState();
}

class _TerapisHistoryState extends State<TerapisHistory> {
  final _future =
      supabase.from('psikolog').select<List<Map<String, dynamic>>>();
  bool verification = true;

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
            title: 'Chat dan History',
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
                CustomerCard(
                  kodeUnik: 'b234as',
                  username: 'akunsekolahdika',
                  jadwal: 'Senin, 12 September 2023 - Jam 12.00',
                  harga: 'Rp 150.000,00',
                  onTapChat: () {},
                  onTapDetail: () {},
                ),
                CustomerCard(
                  kodeUnik: 'b234as',
                  username: 'akunsekolahdika',
                  jadwal: 'Senin, 12 September 2023 - Jam 12.00',
                  harga: 'Rp 150.000,00',
                  onTapChat: () {},
                  onTapDetail: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
