import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentalove_app/ui/pages/chat_page.dart';
import 'package:mentalove_app/ui/pages/counseling.dart';
import 'package:mentalove_app/ui/pages/daily_content.dart';
import 'package:mentalove_app/ui/pages/history.dart';
import 'package:mentalove_app/ui/pages/profile_page.dart';
import 'package:mentalove_app/ui/pages/tell_us.dart';
import 'package:mentalove_app/ui/shared/theme.dart';

import '../../cubit/page_cubit.dart';
import '../widgets/custom_button_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return TellUsPage();
        case 1:
          return Counseling();
        case 2:
          return ChatPage();
        case 3:
          return DailyContentPage();
        case 4:
          return HistoryPage();
        case 5:
          return ProfilePage();
        default:
          return TellUsPage();
      }
    }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 24,
                spreadRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonNavigationItem(
                index: 0,
                imageUrl: 'assets/ic_tellus.png',
              ),
              CustomButtonNavigationItem(
                index: 1,
                imageUrl: 'assets/ic_counseling.png',
              ),
              CustomButtonNavigationItem(
                index: 2,
                imageUrl: 'assets/ic_chat.png',
              ),
              CustomButtonNavigationItem(
                index: 3,
                imageUrl: 'assets/ic_dailycontent.png',
              ),
              CustomButtonNavigationItem(
                index: 4,
                imageUrl: 'assets/ic_history.png',
              ),
              CustomButtonNavigationItem(
                index: 5,
                imageUrl: 'assets/ic_profile.png',
              )
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
