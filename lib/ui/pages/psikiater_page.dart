import 'dart:io';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentalove_app/model/terapis_model.dart';
import 'package:mentalove_app/services/crud.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';

class PsikiaterPage extends StatefulWidget {
  const PsikiaterPage({super.key});

  @override
  State<PsikiaterPage> createState() => _PsikiaterPageState();
}

class _PsikiaterPageState extends State<PsikiaterPage> {
  late Terapis terapis;

  void setData(Terapis data) {
    setState(() {
      terapis = data;
    });
  }

  @override
  void initState() {
    Future fetchData() async {
      Map<String, dynamic> data =
          await readData('64eddfc1b89ed14ca51f', '64eddca5a7aca6abc1f9');
      List<Document> data2 = await listDocuments('64eddca5a7aca6abc1f9');
      stderr.writeln(data2);
      setData(Terapis(
          id: "a",
          nama: data['nama'],
          password: data['password'],
          email: data['email'],
          rating: data['rating'],
          harga: data['harga'],
          lamaPengalaman: data['lama_pengalaman'],
          keahlian: data['keahlian']));
    }

    fetchData();
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
                PsikologCard(
                    image: AssetImage('assets/detail_pfp.png'),
                    name: terapis.nama,
                    position: 'Psikologi Klinis',
                    expertise: 'Depresi, Trauma, Pekerjaan',
                    price: 'Rp 40.000 - Rp 45.000',
                    workPeriod: terapis.lamaPengalaman,
                    rating: terapis.rating.toString()),
                PsikologCard(
                  image: AssetImage('assets/detail_pfp.png'),
                  name: 'Aris Prabowo Wijayanto',
                  position: 'Psikologi Klinis',
                  expertise: 'Depresi, Trauma, Pekerjaan',
                  price: 'Rp 40.000 - Rp 45.000',
                  workPeriod: '2 tahun',
                  rating: '97%',
                ),
                const PsikologCard(
                  image: AssetImage('assets/detail_pfp.png'),
                  name: 'Aris Prabowo Wijayanto',
                  position: 'Psikologi Klinis',
                  expertise: 'Depresi, Trauma, Pekerjaan',
                  price: 'Rp 40.000 - Rp 45.000',
                  workPeriod: '2 tahun',
                  rating: '97%',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
