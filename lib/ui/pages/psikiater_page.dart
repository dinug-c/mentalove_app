import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'detail.dart';

class PsikiaterPage extends StatefulWidget {
  const PsikiaterPage({super.key});

  @override
  State<PsikiaterPage> createState() => _PsikiaterPageState();
}

class _PsikiaterPageState extends State<PsikiaterPage> {
  final _future = Supabase.instance.client
      .from('psikiater')
      .select<List<Map<String, dynamic>>>();

  // @override
  // void initState() {
  //   super.initState();
  //   readData();
  // }

  // Future<void> readData() async {
  //   var response = await supabase
  //       .from('psikiater')
  //       .select()
  //       .order('id', ascending: true)
  //       .execute();

  //   setState(() {
  //     psikiaterList = response.data.toList();
  //   });
  // }

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
            title: 'Psikiater',
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
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('Tidak ada yang tersedia'));
                    }

                    final psikiaters = snapshot.data!;
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: psikiaters.length,
                        itemBuilder: ((context, index) {
                          final psikiater = psikiaters[index];
                          int harga = psikiater['harga'];
                          String hargaRp = NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp. ',
                            decimalDigits: 0,
                          ).format(harga);

                          int tahun = psikiater[
                              'year']; // Tahun yang disimpan dalam variabel
                          int tahunSaatIni = DateTime.now().year;
                          int displayTahun = tahunSaatIni - tahun;
                          String tagsString = psikiater['tags'].join(', ');
                          return PsikologCard(
                            image: const AssetImage('assets/detail_pfp.png'),
                            name: psikiater['name'],
                            position: psikiater['title'],
                            expertise: tagsString,
                            price: hargaRp,
                            workPeriod: '$displayTahun tahun',
                            rating: psikiater['rating'].toString(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(terapisData: psikiater),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    );
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
