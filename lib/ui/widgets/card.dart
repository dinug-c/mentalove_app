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

class MediaCard extends StatelessWidget {
  final String title;
  final Function() onTap;

  const MediaCard({
    Key? key,
    required this.title,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
              ),
            ),
            SizedBox(
              width: parentWidth * 0.6,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: extraBold),
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
        width: double.infinity,
        height: 120,
        
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(image: faceEmoji, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: parentWidth * 0.6,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    textAlign: TextAlign.end,
                    style: whiteTextStyle.copyWith(
                      fontSize: 12, fontWeight: light, 
                    )
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: extraBold),
                        ),
                        Text(
                          text,
                          style: whiteTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ]),
                  ),
                  
                ],
              ),
            )
        ])
    );
  }
}

class DailyCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String desc;
  final Function() onTap;

  const DailyCard({
    Key? key,
    required this.image,
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
              image: DecorationImage(image: image, fit: BoxFit.cover),
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
            )
          )
          
        ],
      ),
    );
  }
}