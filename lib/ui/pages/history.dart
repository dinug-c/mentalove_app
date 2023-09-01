import 'dart:io';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/model/history_model.dart';

import '../../services/crud.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late History history;

  void setData(History data) {
    setState(() {
      history = data;
    });
  }

  @override
  void initState() {
    Future fetchData() async {
      Map<String, dynamic> data =
          await readData('64f1de1a8d2fdd9c3e22', '64f1dc2f04b181f52184');
      List<Document> data2 = await listDocuments('64f1dc2f04b181f52184');
      stderr.writeln(data2);
      setData(History(
        // faceEmoji: data['\$faceemoji'],
        title: data['title'],
        date: data['date'],
        text: data['text']
      )
      );
    }

    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarCustom(
            title: 'History',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Column(
                    children: [
                      gapH12,
                      HistoryCard(
                        faceEmoji: AssetImage('assets/smile_emo.png'), 
                        title: "Lebih baik dari biasanya", 
                        date: 'hari ini', 
                        text: 'Semangat ya! karena kamu sudah lebih baik dari biasanya'
                      ),
                      gapH12,
                      HistoryCard(
                        faceEmoji: AssetImage('assets/flat_emo.png'), 
                        title: "Lebih baik dari biasanya", 
                        date: 'kemarin', 
                        text: 'Semangat ya! karena kamu sudah lebih baik dari biasanya'
                      ),
                      gapH12,
                      HistoryCard(
                        faceEmoji: AssetImage('assets/sad_emo.png'), 
                        title: "Lebih baik dari biasanya", 
                        date: '27 Juni 2023', 
                        text: 'Semangat ya! karena kamu sudah lebih baik dari biasanya'
                      ),
                    ],
                  ),
                )
                
              ]
            )
          )
        ]
      )
    );
  }
}