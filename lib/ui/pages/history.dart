import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/controllers/storage_controller.dart';

import '../../main.dart';
import '../widgets/card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _future = supabase
      .from('history')
      .select<List<Map<String, dynamic>>>()
      .eq('username', storageController.getData('uid'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: CustomScrollView(slivers: <Widget>[
          AppBarCustom(
            title: 'History',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Center(
                //   child: Container(
                //     height: MediaQuery.of(context).size.height - 120,
                //     child: Center(
                //       child: Text(
                //         'Coming Soon',
                //         style: whiteTextStyle.copyWith(
                //             fontSize: 20, fontWeight: extraBold),
                //       ),
                //     ),
                //   ),
                // )
                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //   child: Column(
                //     children: [
                FutureBuilder<List<Map<String, dynamic>>>(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('Tidak ada yang tersedia'));
                      }
                      final histories = snapshot.data!;
                      return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: histories.length,
                          itemBuilder: ((context, index) {
                            final history = histories[index];
                            return HistoryCard(
                              title: history['title'],
                              date: history['date'],
                              text: history['text'],
                              faceEmoji: AssetImage(history['faceEmoji']),
                            );
                          }),
                        ),
                      );
                    })
                // gapH12,
                // HistoryCard(
                //     faceEmoji: AssetImage('assets/smile_emo.png'),
                //     title: "Lebih baik dari biasanya",
                //     date: 'hari ini',
                //     text:
                //         'Semangat ya! karena kamu sudah lebih baik dari biasanya'),
                // gapH12,
                // HistoryCard(
                //     faceEmoji: AssetImage('assets/flat_emo.png'),
                //     title: "Lebih baik dari biasanya",
                //     date: 'kemarin',
                //     text:
                //         'Semangat ya! karena kamu sudah lebih baik dari biasanya'),
                // gapH12,
                // HistoryCard(
                //     faceEmoji: AssetImage('assets/sad_emo.png'),
                //     title: "Lebih baik dari biasanya",
                //     date: '27 Juni 2023',
                //     text:
                //         'Semangat ya! karena kamu sudah lebih baik dari biasanya'),
              ],
            ),
          )
        ]));
    // ]));
  }
}
