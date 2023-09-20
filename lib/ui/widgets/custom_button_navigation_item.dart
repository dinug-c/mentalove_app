import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentalove_app/ui/shared/theme.dart';

import '../../cubit/page_cubit.dart';

class CustomButtonNavigationItem extends StatelessWidget {
  final int index;
  final String imageUrl;

  const CustomButtonNavigationItem({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Container(
          width: MediaQuery.of(context).size.width / 6,
          decoration: BoxDecoration(
            color: (context.read<PageCubit>().state == index)
                ? kPrimaryLightColor
                : Colors.transparent,
          ),
          child: Center(
            child: Image.asset(
              imageUrl,
              width: 24,
              height: 24,
              color: kPrimary2Color,
            ),
          )),
    );
  }
}
