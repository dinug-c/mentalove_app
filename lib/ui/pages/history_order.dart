import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/controllers/storage_controller.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';

import '../widgets/card.dart';
import 'chat_psikolog_page.dart';

import '../widgets/card.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
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
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        final datas = snapshot.data!;
                        return SingleChildScrollView(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: datas.length,
                              itemBuilder: ((context, index) {
                                final data = datas[index];
                                return OrderCard(
                                  kodeUnik: data['kode_unik'],
                                  verif: data['is_verified'] ?? false,
                                  nama: "Nama Psikolog: ${data['upsikolog']}",
                                  title: "Order",
                                  jadwal: "${data['tanggal']} ${data['jam']}",
                                  harga: 'Rp ${data['harga']}',
                                  onTap: () {
                                    var verif = data['is_verified'] ?? false;
                                    if (verif) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatPsikologPage(
                                                      psikologId:
                                                          data['upsikolog'],
                                                      userId:
                                                          data['uprofile'])));
                                    } else {
                                      showToast(
                                          context, "Order belum diverifikasi");
                                    }
                                  },
                                );
                              })),
                        );
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
