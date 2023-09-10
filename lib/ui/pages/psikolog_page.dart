import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mentalove_app/main.dart';
import 'package:mentalove_app/ui/pages/detail.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';

class PsikologPage extends StatefulWidget {
  const PsikologPage({super.key});

  @override
  State<PsikologPage> createState() => _PsikologPageState();
}

class _PsikologPageState extends State<PsikologPage> {
  final _future =
      supabase.from('psikolog').select<List<Map<String, dynamic>>>();

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
            title: 'Psikolog',
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
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final psikologs = snapshot.data!;
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: psikologs.length,
                        itemBuilder: ((context, index) {
                          final psikolog = psikologs[index];
                          int harga = psikolog['harga'];
                          String hargaRp = NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp. ',
                            decimalDigits: 0,
                          ).format(harga);

                          int tahun = psikolog[
                              'year']; // Tahun yang disimpan dalam variabel
                          int tahunSaatIni = DateTime.now().year;
                          int displayTahun = tahunSaatIni - tahun;
                          String tagsString = psikolog['tags'].join(', ');
                          return PsikologCard(
                            image: const AssetImage('assets/default_pfp.png'),
                            name: psikolog['name'],
                            position: psikolog['title'],
                            expertise: tagsString,
                            price: hargaRp,
                            workPeriod: '$displayTahun tahun',
                            rating: psikolog['rating'].toString(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(terapisData: psikolog),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    );
                  },
                ),
                // const PsikologCard(
                //   image: AssetImage('assets/detail_pfp.png'),
                //   name: 'Aris Prabowo Wijayanto',
                //   position: 'Psikologi Klinis',
                //   expertise: 'Depresi, Trauma, Pekerjaan',
                //   price: 'Rp 40.000 - Rp 45.000',
                //   workPeriod: '2 tahun',
                //   rating: '97%',
                // ),
                // const PsikologCard(
                //   image: AssetImage('assets/detail_pfp.png'),
                //   name: 'Aris Prabowo Wijayanto',
                //   position: 'Psikologi Klinis',
                //   expertise: 'Depresi, Trauma, Pekerjaan',
                //   price: 'Rp 40.000 - Rp 45.000',
                //   workPeriod: '2 tahun',
                //   rating: '97%',
                // ),
                // const PsikologCard(
                //   image: AssetImage('assets/detail_pfp.png'),
                //   name: 'Aris Prabowo Wijayanto',
                //   position: 'Psikologi Klinis',
                //   expertise: 'Depresi, Trauma, Pekerjaan',
                //   price: 'Rp 40.000 - Rp 45.000',
                //   workPeriod: '2 tahun',
                //   rating: '97%',
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
