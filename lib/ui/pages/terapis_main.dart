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

class TerapisMainPage extends StatefulWidget {
  const TerapisMainPage({super.key});

  @override
  State<TerapisMainPage> createState() => _TerapiMainState();
}

class _TerapiMainState extends State<TerapisMainPage> {
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
            title: 'Main Menu',
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/terapis-history');
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          size: 70,
                          color: kPurpleColor,
                        ),
                        gapW24,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chat dengan Customer',
                                maxLines: 2,
                                style: blackTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: extraBold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Tekan untuk melakukan chat dengan customer',
                                style: blackTextStyle.copyWith(fontSize: 12),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              gapH24,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
