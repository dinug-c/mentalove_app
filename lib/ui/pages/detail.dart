import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/shared/gaps.dart';
import 'package:mentalove_app/ui/shared/theme.dart';
import 'package:mentalove_app/ui/widgets/appbar.dart';
import 'package:mentalove_app/ui/widgets/card.dart';
import 'package:mentalove_app/ui/widgets/button.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

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
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          //AppBar
          AppBarTransparent(
            img: 'assets/detail_pfp.png',
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
                              'Aris Prabowo Wijayanto',
                              style: blackTextStyle.copyWith(
                                  fontSize: 20, fontWeight: extraBold),
                            ),
                            Text('Psikologi Klinis',
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
                                      '97%',
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
                                      '10 tahun',
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
                            const Wrap(
                              spacing: 20,
                              children: [
                                CategoryCard(text: 'Depresi'),
                                CategoryCard(text: 'Trauma'),
                                CategoryCard(text: 'Pekerjaan')
                              ],
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
                              Wrap(
                                spacing: 8,
                                children: List.generate(6, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTanggal = index;
                                      });
                                    },
                                    child: SelectionButton(
                                      isIcon: index == 5 ? true : false,
                                      text: tanggal[index],
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
                                  );
                                }),
                              ),
                              gapH12,
                              Text('Pilih Waktu',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: extraBold, fontSize: 14)),
                              gapH(8),
                              Wrap(
                                spacing: 8,
                                children: List.generate(5, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedJam = index;
                                      });
                                    },
                                    child: SelectionButton(
                                      isIcon: false,
                                      text: jam[index],
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
                                  );
                                }),
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
                            Navigator.pushNamed(context, '/pembayaran');
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
