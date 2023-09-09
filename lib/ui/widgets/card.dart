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

class PsikologCard extends StatelessWidget {
  final AssetImage image;
  final String name;
  final String position;
  final String expertise;
  final String price;
  final String workPeriod;
  final String rating;
  final Function() onTap;

  const PsikologCard(
      {super.key,
      required this.image,
      required this.name,
      required this.position,
      required this.expertise,
      required this.price,
      required this.workPeriod,
      required this.rating,
      required this.onTap});

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
                image: DecorationImage(image: image, fit: BoxFit.cover)),
          ),
          gapW12,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              name,
              style:
                  blackTextStyle.copyWith(fontSize: 15, fontWeight: extraBold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              position,
              style:
                  blackTextStyle.copyWith(fontSize: 12, fontWeight: extraBold),
            ),
            Text(
              expertise,
              style: blackTextStyle.copyWith(fontSize: 12),
            ),
            gapH24,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(price,
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: extraBold)),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: ElevatedButton(
                        onPressed: () {
                          onTap();
                          // Navigator.pushNamed(context, '/detail');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPurpleColor,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        child: Text('Jadwalkan',
                            style: whiteTextStyle.copyWith(
                                fontSize: 12, fontWeight: extraBold)),
                      ),
                    ),
                  ],
                ),
                gapW8,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(workPeriod,
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: extraBold)),
                    gapH4,
                    Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                          Text(rating,
                              style: purpleTextStyle.copyWith(
                                  fontSize: 12, fontWeight: extraBold)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ]),
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
  final AssetImage? image;
  final String title;
  final String desc;
  final Function() onTap;

  const DailyCard({
    Key? key,
    this.image,
    required this.title,
    required this.desc,
    required this.onTap,
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
                  image: image ?? AssetImage('assets/detail_pfp.png'),
                  fit: BoxFit.cover),
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
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Text(
                    desc,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
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
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                    children: <TextSpan>[
                  TextSpan(
                    text: ' Baca Selengkapnya',
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                ])),
            gapH8,
            Container(
              height: image != null ? 250 : 0,
              decoration: BoxDecoration(
                  image: image != null
                      ? DecorationImage(image: image!, fit: BoxFit.cover)
                      : null,
                  borderRadius: BorderRadius.circular(20)),
            ),
            gapH8,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    size: 24.0,
                  ),
                  gapW12,
                  Icon(Icons.chat_bubble_outline, size: 24.0),
                  gapW12,
                  Icon(Icons.share_outlined, size: 24.0)
                ]),
                const Icon(
                  Icons.bookmark_outline,
                  size: 24.0,
                )
              ],
            )
          ])),
    );
  }
}
