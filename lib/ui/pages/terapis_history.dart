// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/controllers/storage_controller.dart';

import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/pages/chat_psikolog_page.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

class TerapisHistory extends StatefulWidget {
  const TerapisHistory({
    Key? key,
  }) : super(key: key);

  @override
  State<TerapisHistory> createState() => _TerapisHistoryState();
}

class _TerapisHistoryState extends State<TerapisHistory> {
  final _future = supabase
      .from('order')
      .select<List<Map<String, dynamic>>>()
      .eq('upsikolog', storageController.getData('uid'));
  bool verification = true;

  @override
  void initState() {
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
            title: 'Order History',
            startColor: kPrimaryColor,
            endColor: kPrimary2Color,
            leftAction: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
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
                              return CustomerCard(
                                kodeUnik: data['kode_unik'],
                                username: data['uprofile'],
                                jadwal: "${data['tanggal']} ${data['jam']}",
                                harga: 'Rp ${data['harga']}',
                                onTapChat: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatPsikologPage(
                                                  psikologId: data['upsikolog'],
                                                  userId: data['uprofile'])));
                                },
                                onTapDetail: () {},
                              );
                            })),
                      );
                    }
                  })
            ]),
          ),
        ],
      ),
    );
  }
}
