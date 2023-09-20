// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../shared/gaps.dart';
import '../shared/theme.dart';

class CardKonseling extends StatelessWidget {
  final String title;
  final AssetImage image;
  final Function() onTap;

  const CardKonseling({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 150,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            gapH(10),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover),
              ),
            ),
            Container(
              width: 110,
              height: 30,
              decoration: BoxDecoration(
                color: kPurpleColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardAhli extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String desc;
  final Function() onTap;

  const CardAhli({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic parentWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: parentWidth * 0.6,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: extraBold),
                  ),
                  Text(
                    desc,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Function() onTap;

  const ProfileCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic parentWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            border: Border(
                top: BorderSide(width: 0.5, color: kPurpleColor),
                bottom: BorderSide(width: 0.5, color: kPurpleColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: kPurpleColor,
            ),
            SizedBox(
              width: parentWidth * 0.6,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: extraBold),
                  ),
                  Text(
                    desc,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PsikologCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String position;
  final String expertise;
  final String price;
  final String workPeriod;
  final String rating;
  final Function() onTap;

  const PsikologCard(
      {super.key,
      required this.name,
      required this.position,
      required this.expertise,
      required this.price,
      required this.workPeriod,
      required this.rating,
      required this.onTap,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              color: kPrimary2Color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
            ),
          ),
          gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: extraBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  position,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: extraBold,
                  ),
                ),
                Text(
                  expertise,
                  style: blackTextStyle.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH24,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: extraBold,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: ElevatedButton(
                            onPressed: () {
                              onTap();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPurpleColor,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              'Jadwalkan',
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: extraBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapW8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          workPeriod,
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: extraBold,
                          ),
                        ),
                        gapH4,
                        Container(
                          width: 60,
                          height: 35,
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 15,
                                color: kPurpleColor,
                              ),
                              gapW(2),
                              Text(
                                rating,
                                style: purpleTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: extraBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final bool verif;
  final String imgUrl;
  final String kodeUnik;
  final String nama;
  final String title;
  final String jadwal;
  final String harga;
  final Function() onTap;
  final bool isFinished;

  const OrderCard(
      {super.key,
      required this.verif,
      required this.kodeUnik,
      required this.nama,
      required this.title,
      required this.jadwal,
      required this.harga,
      required this.onTap,
      required this.isFinished,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 160,
            decoration: BoxDecoration(
              color: kPrimary2Color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
            ),
          ),
          gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#$kodeUnik',
                  maxLines: 2,
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: extraBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  nama,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: extraBold,
                  ),
                ),
                Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH24,
                Text(
                  jadwal,
                  style: blackTextStyle.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      harga,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: extraBold,
                      ),
                    ),
                    gapW4,
                    Text(
                      verif ? '- Sudah terverifikasi' : '- Belum terverifikasi',
                      style: blackTextStyle.copyWith(
                          color: verif ? kGreenColor : kRedColor,
                          fontSize: 12,
                          fontWeight: bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              (isFinished) ? kGreyColor : kPurpleColor,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: kWhiteColor,
                            ),
                            gapW4,
                            Text(
                              (isFinished) ? 'Order Selesai' : 'Chat',
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: extraBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    gapW4,
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  final String kodeUnik;
  final String username;
  final String jadwal;
  final String harga;
  final Function() onTapChat;
  final Function() onTapDetail;
  const CustomerCard(
      {super.key,
      required this.kodeUnik,
      required this.username,
      required this.jadwal,
      required this.harga,
      required this.onTapChat,
      required this.onTapDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

      decoration: BoxDecoration(
        border: Border(
          // top: BorderSide(width: 1.0, color: kPurpleColor.withOpacity(0.5)),
          bottom: BorderSide(width: 1.5, color: kPurpleColor.withOpacity(0.8)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.chat,
            size: 70,
            color: kPurpleColor,
          ),
          gapW24,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#$kodeUnik',
                  maxLines: 2,
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: extraBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  username,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: extraBold,
                  ),
                ),
                gapH24,
                Text(
                  jadwal,
                  style: blackTextStyle.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      harga,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: extraBold,
                      ),
                    ),
                    gapW4,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onTapChat,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPurpleColor,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: kWhiteColor,
                            ),
                            gapW4,
                            Text(
                              'Chat',
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: extraBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    gapW4,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onTapDetail;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryLightColor,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Detail...',
                          style: purpleTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: extraBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String text;

  const CategoryCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor,
              foregroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              elevation: 0),
          child: Text(
            text,
            style: purpleTextStyle.copyWith(fontWeight: light),
          )),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final AssetImage faceEmoji;
  final String title;
  final String date;
  final String text;

  const HistoryCard({
    Key? key,
    required this.faceEmoji,
    required this.title,
    required this.date,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic parentWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      width: parentWidth,
      height: 130,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(image: faceEmoji, fit: BoxFit.cover),
          ),
        ),
        Container(
          width: parentWidth * 0.6,
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Text(
                    date,
                    style: whiteTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  )
                ],
              ),
              Text(
                title,
                style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
              Text(
                text,
                maxLines: 2,
                style:
                    whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class DailyCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final Function() onTap;

  const DailyCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.onTap,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH12,
          Container(
            width: 110,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
              color: kGreyColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          gapH8,
          SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    desc,
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class TellUsCard extends StatelessWidget {
  final AssetImage profil;
  final String name;
  final String date;
  final String desc;
  final AssetImage? image;
  final Function() onTap;

  const TellUsCard({
    Key? key,
    this.image,
    required this.name,
    required this.date,
    required this.desc,
    required this.profil,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic parentWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: kWhiteColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: parentWidth,
              height: 50,
              decoration: BoxDecoration(
                color: kWhiteColor,
              ),
              child: Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: profil, fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Expanded(
                  child: Container(
                      width: 110,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: extraBold),
                            ),
                            Text(
                              date,
                              style: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: regular),
                            )
                          ])),
                )
              ]),
            ),
            gapH8,
            RichText(
                text: TextSpan(
              text: desc,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            )),
            gapH8,
            Container(
              height: image != null ? 250 : 0,
              decoration: BoxDecoration(
                  image: image != null
                      ? DecorationImage(image: image!, fit: BoxFit.cover)
                      : null,
                  borderRadius: BorderRadius.circular(20)),
            ),
            // gapH8,
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(children: <Widget>[
            //       Icon(
            //         Icons.favorite_border,
            //         size: 24.0,
            //       ),
            //       gapW12,
            //       Icon(Icons.chat_bubble_outline, size: 24.0),
            //       gapW12,
            //       Icon(Icons.share_outlined, size: 24.0)
            //     ]),
            //     const Icon(
            //       Icons.bookmark_outline,
            //       size: 24.0,
            //     )
            //   ],
            // )
          ])),
    );
  }
}
