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
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 160,
                        decoration: BoxDecoration(
                          color: kPrimary2Color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: const DecorationImage(
                              image: AssetImage('assets/detail_pfp.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      gapW12,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#kode-unik',
                              maxLines: 2,
                              style: blackTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: extraBold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Aris Prabowo Wijayanto',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: extraBold,
                              ),
                            ),
                            Text(
                              'Psikolog',
                              style: blackTextStyle.copyWith(fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            gapH24,
                            Text(
                              'Senin, 11 September 2023 - Jam 11.00',
                              style: blackTextStyle.copyWith(fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rp 150.000',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: extraBold,
                                  ),
                                ),
                                gapW4,
                                Text(
                                  verification
                                      ? '- Sudah terverifikasi'
                                      : '- Belum terverifikasi',
                                  style: blackTextStyle.copyWith(
                                      color: verification
                                          ? kGreenColor
                                          : kRedColor,
                                      fontSize: 12,
                                      fontWeight: bold),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kPurpleColor,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.chat,
                                          color: kWhiteColor,
                                        ),
                                        gapW4,
                                        Text(
                                          'Chat',
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: extraBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                gapW4,
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kPrimaryLightColor,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Detail...',
                                      style: purpleTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: extraBold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
