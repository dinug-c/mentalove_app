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
