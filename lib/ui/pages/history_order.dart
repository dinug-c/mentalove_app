import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/controllers/storage_controller.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/gaps.dart';
import '../widgets/card.dart';
import 'chat_psikolog_page.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
}

@override
Future<void> _openBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw 'Could not launch $url';
  }
}

class _HistoryOrderState extends State<HistoryOrder> {
  final _future = supabase
      .from('order')
      .select<List<Map<String, dynamic>>>()
      .eq('uprofile', storageController.getData('uid'));
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
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          AppBarCustom(
            title: 'History Order',
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
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('Tidak ada yang tersedia'));
                      }
                      final datas = snapshot.data!;
                      return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: datas.length,
                            itemBuilder: ((context, index) {
                              final data = datas[index];
                              return OrderCard(
                                kodeUnik: data['kode_unik'],
                                imgUrl: data['image_url'],
                                isVidcallReady: data['isVidcallReady'] ?? false,
                                linkUrl: data['link_vidcall'].toString(),
                                verif: data['is_verified'] ?? false,
                                nama: "Nama Psikolog: ${data['upsikolog']}",
                                media: data['media'] ?? "Chat",
                                jadwal: "${data['tanggal']} ${data['jam']}",
                                harga: 'Rp ${data['harga']}',
                                isFinished: data['is_finished'],
                                onTap: () {
                                  var verif = data['is_verified'] ?? false;
                                  var finish = data['is_finished'] ?? false;
                                  var media = data['media'] ?? "Chat";
                                  var link_vidcall = data['link_vidcall'] ?? '';
                                  var isVidcallReady =
                                      data['isVidcallReady'] ?? false;

                                  if (media == "Chat") {
                                    if (!finish) {
                                      if (verif) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatPsikologPage(
                                                      psikologId:
                                                          data['upsikolog'],
                                                      userId: data['uprofile'],
                                                      kodeUnik:
                                                          data['kode_unik'],
                                                    )));
                                      } else {
                                        showToast(context,
                                            "Order belum diverifikasi");
                                      }
                                    } else {
                                      showToast(context, "Order sudah selesai");
                                    }
                                  } else if (media == "Video Call") {
                                    if (!finish) {
                                      if (verif) {
                                        if (isVidcallReady) {
                                          _openBrowser(link_vidcall);
                                        } else {
                                          showToast(
                                              context, "Link belum ready");
                                        }
                                      } else {
                                        showToast(context,
                                            "Order belum diverifikasi");
                                      }
                                    } else {
                                      showToast(context, "Order sudah selesai");
                                    }
                                  }
                                },
                              );
                            })),
                      );
                    }),
                gapH(100)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
