import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:mentalove_app/ui/widgets/button.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarTransparent(
            img: 'assets/detail_pfp.png',
            leftAction: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back_ios,
            rightAction: () {},
            rightIcon: Icons.share,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aris Prabowo Wijayanto',
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: extraBold),
                          ),
                          Text('Psikologi Klinis',
                              style: blackTextStyle.copyWith(fontSize: 16)),
                          gapH12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_sharp,
                                    color: kPurpleColor,
                                  ),
                                  gapW(4),
                                  Text(
                                    '97%',
                                    style: purpleTextStyle.copyWith(
                                        fontSize: 16, fontWeight: bold),
                                  )
                                ],
                              ),
                              gapW24,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.badge,
                                    color: kPurpleColor,
                                  ),
                                  gapW(4),
                                  Text(
                                    '10 tahun',
                                    style: purpleTextStyle.copyWith(
                                        fontSize: 16, fontWeight: bold),
                                  )
                                ],
                              )
                            ],
                          )
                        ]))
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
            border: Border(top: BorderSide(color: kPurpleColor, width: 1.0))),
        height: 80,
        child: Column(
          children: <Widget>[
            Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        //padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Button(
                                text: "Konfirmasi Penjadwalan",
                                textColor: kWhiteColor,
                                startColor: kPurpleColor,
                                endColor: kPurpleColor,
                                onPressed: () {
                                  //Navigator.pushNamed(context, '/detail');
                                })
                          ],
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
