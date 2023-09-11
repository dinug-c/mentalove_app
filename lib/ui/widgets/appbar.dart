import 'package:flutter/material.dart';
import '../shared/theme.dart';

class AppBarCustom extends StatelessWidget {
  final String title;
  final Color startColor;
  final Color endColor;
  final Function()? leftAction;
  final Function()? rightAction;
  final IconData? leftIcon;
  final IconData? rightIcon;

  const AppBarCustom({
    Key? key,
    required this.title,
    required this.startColor,
    required this.endColor,
    this.leftAction,
    this.leftIcon,
    this.rightAction,
    this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 50,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          // LinearGradient
          gradient: LinearGradient(
            // colors for gradient
            colors: [
              startColor,
              endColor,
            ],
          ),
        ),
      ),
      // title of appbar
      title: Text(
        title,
        style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: leftAction,
        icon: Icon(leftIcon, color: kWhiteColor),
      ),
      actions: [
        IconButton(
          onPressed: rightAction,
          icon: Icon(rightIcon, color: kWhiteColor),
        ),
      ],
    );
  }
}

class AppBarTransparent extends StatelessWidget {
  final String img;
  final Function() leftAction;
  final Function()? rightAction;
  final IconData leftIcon;
  final IconData? rightIcon;

  const AppBarTransparent({
    Key? key,
    required this.leftAction,
    required this.leftIcon,
    this.rightAction,
    this.rightIcon,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 200,
      backgroundColor: kPurpleColor,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(img,
            fit: BoxFit.cover,
            color: kBlackColor.withOpacity(0.4),
            colorBlendMode: BlendMode.darken),
      ),
      leading: IconButton(
        onPressed: leftAction,
        icon: Icon(leftIcon, color: kWhiteColor),
      ),
      actions: [
        IconButton(
          onPressed: rightAction,
          icon: Icon(rightIcon, color: kWhiteColor),
        ),
      ],
    );
  }
}

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
