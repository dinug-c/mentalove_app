import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/pages/pembayaran.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/button.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';

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
  List tanggal = [
    'Senin, 03/07',
    'Selasa, 04/07',
    'Rabu, 05/07',
    'Kamis, 06/07',
    'Jumat, 07/07',
    'null'
  ];

  List jam = ['09:00', '10:00', '11:00', '12:00', '13:00'];

  @override
  Widget build(BuildContext context) {
    final terapisData = widget.terapisData;

    int tahun = terapisData['year']; // Tahun yang disimpan dalam variabel
    int tahunSaatIni = DateTime.now().year;
    int displayTahun = tahunSaatIni - tahun;

    Map<String, dynamic> waktuData = terapisData['waktu'];

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          //AppBar
          AppBarTransparent(
            img: 'assets/default_pfp.png',
            leftAction: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back_ios,
            rightAction: () {},
            rightIcon: Icons.share,
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
                                        showToast(context,
                                            'Videocall belum tersedia');
                                        // setState(() {
                                        //   mode = true;
                                        // });
                                      },
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              width: 1.0, color: kPurpleColor),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 13.0),
                                          backgroundColor: Colors.grey,
                                          // mode ? kPurpleColor : kWhiteColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          elevation: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.person_pin_rounded,
                                              color: kWhiteColor
                                              // mode
                                              //     ? kWhiteColor
                                              //     : kPurpleColor
                                              ),
                                          gapW12,
                                          Text('Video Call',
                                              style: blackTextStyle.copyWith(
                                                  color: kWhiteColor
                                                  // mode
                                                  //     ? kWhiteColor
                                                  //     : kPurpleColor
                                                  ,
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
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: SizedBox(
                                  height: 65,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: waktuData.keys.length,
                                    itemBuilder: (context, index) {
                                      final hari =
                                          waktuData.keys.elementAt(index);
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(
                                                left: 0.0, right: 3.5)
                                            : const EdgeInsets.symmetric(
                                                horizontal: 3.5),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedTanggal = index;
                                            });
                                          },
                                          child: SelectionButton(
                                            isIcon: false,
                                            text: hari,
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
                                      );
                                    },
                                  ),
                                ),
                              ),
                              gapH12,
                              Text('Pilih Waktu',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: extraBold, fontSize: 14)),
                              gapH(8),
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: SizedBox(
                                  height: 65,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: waktuData.keys.length,
                                    itemBuilder: (context, index) {
                                      final hari = waktuData.keys
                                          .elementAt(selectedTanggal);
                                      final jamList = waktuData[hari];
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(
                                                left: 0.0, right: 3.5)
                                            : const EdgeInsets.symmetric(
                                                horizontal: 3.5),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedJam = index;
                                            });
                                          },
                                          child: SelectionButton(
                                            isIcon: false,
                                            text: jamList[index],
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
                                      );
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
