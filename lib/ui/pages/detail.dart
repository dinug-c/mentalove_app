import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/pages/pembayaran.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';
import 'dart:convert';

import '../../main.dart';

class Detail extends StatefulWidget {
  final Map<String, dynamic> terapisData;
  const Detail({super.key, required this.terapisData});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool mode = false;
  int selectedTanggal = 0;
  int selectedJam = 0;
  Map<String, dynamic> dateData = {};

  void filterDateData(List<dynamic> res) {
    // Buat set dari data res
    Set<String> resSet = Set<String>.from(
        res.map((item) => "${item['tanggal']}-${item['jam']}"));

    // Buat dateData yang telah difilter
    Map<String, dynamic> filteredDateData = {};

    dateData.forEach((hari, jamList) {
      // Buat list jam yang akan ditampilkan pada hari ini
      List<String> filteredJamList =
          jamList.where((jam) => !resSet.contains("$hari-$jam")).toList();

      // Tambahkan data jika ada jam yang tersedia
      if (filteredJamList.isNotEmpty) {
        filteredDateData[hari] = filteredJamList;
      }
    });

    // Simpan hasil filter ke dateData
    setState(() {
      dateData = filteredDateData;
    });
  }

  void fetchData() async {
    try {
      var res = await supabase
          .from('order')
          .select('tanggal, jam')
          .eq('is_verified', true)
          .eq('is_finished', false);
      dateData = widget.terapisData['waktu'];
      filterDateData(res);
    } catch (e) {}
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final terapisData = widget.terapisData;
    int tahun = terapisData['year']; // Tahun yang disimpan dalam variabel
    int tahunSaatIni = DateTime.now().year;
    int displayTahun = tahunSaatIni - tahun;

    Map<String, dynamic> waktuData = dateData;
    Map<int, dynamic> hariKeIndeks = {};
    int indeks = 0;
    waktuData.forEach((hari, _) {
      hariKeIndeks[indeks] = waktuData[hari];
      indeks++;
    });

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          //AppBar
          AppBarTransparent(
            img: terapisData['image_url'],
            leftAction: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back_ios,
          ),

          //Body
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Nama Psikolog
                            Text(
                              terapisData['name'],
                              style: blackTextStyle.copyWith(
                                  fontSize: 20, fontWeight: extraBold),
                            ),
                            Text(terapisData['title'],
                                style: blackTextStyle.copyWith(fontSize: 16)),
                            gapH12,

                            //Rating + lama
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up_sharp,
                                      color: kPurpleColor,
                                    ),
                                    gapW(4),
                                    Text(
                                      terapisData['rating'].toString(),
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16, fontWeight: bold),
                                    )
                                  ],
                                ),
                                gapW24,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.badge,
                                      color: kPurpleColor,
                                    ),
                                    gapW(4),
                                    Text(
                                      '$displayTahun tahun',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16, fontWeight: bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                            gapH32,

                            //Kategori
                            Text(
                              'Bidang Keahlian',
                              style: blackTextStyle.copyWith(
                                  fontWeight: extraBold, fontSize: 14),
                            ),
                            gapH4,
                            Wrap(
                              spacing: 20,
                              children: List.generate(
                                terapisData['tags'].length,
                                (index) => CategoryCard(
                                    text: terapisData['tags'][index]),
                              ),
                            ),
                            gapH32,

                            //Pilih Chat/VideoCall
                            Text('Pilih Sarana',
                                style: blackTextStyle.copyWith(
                                    fontWeight: extraBold, fontSize: 14)),
                            gapH4,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          mode = false;
                                        });
                                      },
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              width: 1.0, color: kPurpleColor),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 13.0),
                                          backgroundColor:
                                              mode ? kWhiteColor : kPurpleColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          elevation: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.chat,
                                            color: mode
                                                ? kPurpleColor
                                                : kWhiteColor,
                                          ),
                                          gapW12,
                                          Text(
                                            'Chat',
                                            style: blackTextStyle.copyWith(
                                                color: mode
                                                    ? kPurpleColor
                                                    : kWhiteColor,
                                                fontWeight: bold),
                                          ),
                                        ],
                                      )),
                                ),
                                gapW12,
                                Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        // showToast(context,
                                        //     'Videocall belum tersedia');
                                        setState(() {
                                          mode = true;
                                        });
                                      },
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              width: 1.0, color: kPurpleColor),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 13.0),
                                          backgroundColor:
                                              mode ? kPurpleColor : kWhiteColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          elevation: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.person_pin_rounded,
                                              color: mode
                                                  ? kWhiteColor
                                                  : kPurpleColor),
                                          gapW12,
                                          Text('Video Call',
                                              style: blackTextStyle.copyWith(
                                                  color: mode
                                                      ? kWhiteColor
                                                      : kPurpleColor,
                                                  fontWeight: bold)),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      gapH24,
                      //Pilih Jadwal
                      Container(
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                        ),
                        width: double.maxFinite,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 10, top: 15, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pilih Tanggal',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: extraBold, fontSize: 14)),
                              gapH(8),
                              dateData.isEmpty
                                  ? const Center(
                                      child: Text('Tidak ada jadwal tersedia'))
                                  : Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: List.generate(
                                        hariKeIndeks.length,
                                        (index) => SelectionButton(
                                          text: hariKeIndeks[index]
                                              .keys
                                              .toList()[0],
                                          isIcon: false,
                                          color: selectedTanggal == index
                                              ? kWhiteColor
                                              : kPurpleColor,
                                          bgColor: selectedTanggal == index
                                              ? kPurpleColor
                                              : kWhiteColor,
                                          onPressed: () {
                                            setState(() {
                                              selectedTanggal = index;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                              gapH12,
                              Text('Pilih Waktu',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: extraBold, fontSize: 14)),
                              gapH(8),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: List.generate(
                                  hariKeIndeks.length == 0
                                      ? 0
                                      : hariKeIndeks[selectedTanggal].length,
                                  (index) => SelectionButton(
                                    text: hariKeIndeks[selectedTanggal][index],
                                    isIcon: false,
                                    color: selectedJam == index
                                        ? kWhiteColor
                                        : kPurpleColor,
                                    bgColor: selectedJam == index
                                        ? kPurpleColor
                                        : kWhiteColor,
                                    onPressed: () {
                                      setState(() {
                                        selectedJam = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      gapH32
                    ]))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: kPurpleColor, width: 1.0))),
        height: 80,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  //padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Button(
                          text: "Konfirmasi Penjadwalan",
                          textColor: kWhiteColor,
                          startColor: kPurpleColor,
                          endColor: kPurpleColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pembayaran(
                                  terapisData: terapisData,
                                  mode: mode,
                                  selectedTanggal: selectedTanggal,
                                  selectedJam: selectedJam,
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
