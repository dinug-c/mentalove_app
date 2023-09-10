import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlackColor.withOpacity(0.5),
        body: CustomScrollView(slivers: <Widget>[
          AppBarCustom(
            title: 'History',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 120,
                child: Center(
                  child: Text(
                    'Coming Soon',
                    style: whiteTextStyle.copyWith(
                        fontSize: 20, fontWeight: extraBold),
                  ),
                ),
              ),
            )
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: const Column(
            //     children: [
            //       gapH12,
            //       HistoryCard(
            //           faceEmoji: AssetImage('assets/smile_emo.png'),
            //           title: "Lebih baik dari biasanya",
            //           date: 'hari ini',
            //           text:
            //               'Semangat ya! karena kamu sudah lebih baik dari biasanya'),
            //       gapH12,
            //       HistoryCard(
            //           faceEmoji: AssetImage('assets/flat_emo.png'),
            //           title: "Lebih baik dari biasanya",
            //           date: 'kemarin',
            //           text:
            //               'Semangat ya! karena kamu sudah lebih baik dari biasanya'),
            //       gapH12,
            //       HistoryCard(
            //           faceEmoji: AssetImage('assets/sad_emo.png'),
            //           title: "Lebih baik dari biasanya",
            //           date: '27 Juni 2023',
            //           text:
            //               'Semangat ya! karena kamu sudah lebih baik dari biasanya'),
            //     ],
            //   ),
            // )
          ]))
        ]));
  }
}
