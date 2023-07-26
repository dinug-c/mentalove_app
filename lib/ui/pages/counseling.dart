import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';

class Counseling extends StatefulWidget {
  const Counseling({super.key});

  @override
  State<Counseling> createState() => _CounselingState();
}

class _CounselingState extends State<Counseling> {
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
            title: 'Counseling',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Body Element
              ],
            ),
          ),
        ],
      ),
    );
  }
}
