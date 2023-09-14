import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';

import '../widgets/card.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
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
            title: 'History Order',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
            leftAction: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back,
            rightIcon: Icons.radio_button_checked,
            rightAction: () {
              setState(() {
                if (verification) {
                  verification = false;
                } else {
                  verification = true;
                }
              });
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                OrderCard(
                  verif: verification,
                  kodeUnik: 'b23f5',
                  nama: 'Aris PW',
                  title: 'Psikolog Klinis',
                  jadwal: 'Senin, 12 September 2023 - Jam 12.00',
                  harga: 'Rp 150.000',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
