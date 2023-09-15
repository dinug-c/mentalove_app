import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/controllers/storage_controller.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';

class TerapisMainPage extends StatefulWidget {
  const TerapisMainPage({super.key});

  @override
  State<TerapisMainPage> createState() => _TerapiMainState();
}

class _TerapiMainState extends State<TerapisMainPage> {
  @override
  void initState() {
    // TODO: implement initState

    final email = supabase.auth.currentUser!.email;
    List<String> parts = email!.split('@');
    String username = parts[0];
    storageController.saveData('uid', username);
    super.initState();
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
            title: 'Main Menu',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
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
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/total-pendapatan');
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
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
                                'Total Pendapatan',
                                maxLines: 2,
                                style: blackTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: extraBold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Tekan untuk melihat total pendapatan yang diperoleh',
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
                ),
                gapH24,
                GestureDetector(
                  onTap: () async {
                    await supabase.auth.signOut();
                    storageController.saveData('temp2', 'guest');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login-page', (context) => false);
                  },
                  child: Container(
                    width: parentW(context),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Logout",
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: bold),
                    )),
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
