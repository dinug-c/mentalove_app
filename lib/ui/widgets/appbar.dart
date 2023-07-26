// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class AppBarCustom extends StatelessWidget {
  final String title;
  final Color startColor;
  final Color endColor;

  const AppBarCustom({
    Key? key,
    required this.title,
    required this.startColor,
    required this.endColor,
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
    );
  }
}
