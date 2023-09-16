import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mentalove_app/controllers/storage_controller.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/model/profile_model.dart';
import 'package:mentalove_app/ui/pages/detail.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _future = supabase
      .from('profiles')
      .select<List<Map<String, dynamic>>>()
      .eq('username', storageController.getData('uid'));

  @override
  Future<void> _openBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

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
            title: 'Profile',
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
                FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('');
                      //const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Terjadi kesalahan: ${snapshot.error}');
                    } else {
                      final user = snapshot.data?[0];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 100,
                            ),
                            gapW4,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username:',
                                  style: purpleTextStyle.copyWith(fontSize: 14),
                                ),
                                Text(
                                  user?['username'],
                                  style: purpleTextStyle.copyWith(
                                      fontSize: 16, fontWeight: extraBold),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
                gapH12,
                ProfileCard(
                  title: 'Chat Admin',
                  desc: 'Kontak Admin via WhatsApp apabila terdapat problem',
                  icon: Icons.warning_rounded,
                  onTap: () {
                    _openBrowser('https://wa.link/skwxnl');
                  },
                ),
                ProfileCard(
                  title: 'About Us',
                  desc: 'Tentang Mentalove.',
                  icon: Icons.info,
                  onTap: () {
                    Navigator.pushNamed(context, '/about-us');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
