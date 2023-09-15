import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/theme.dart';
import '../widgets/appbar.dart';

class AfterChat extends StatefulWidget {
  const AfterChat({super.key});

  @override
  State<AfterChat> createState() => _AfterChatState();
}

class _AfterChatState extends State<AfterChat> {
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
            title: 'Tambah Status',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
        ],
      ),
    );
  }
}
