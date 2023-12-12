import 'package:diary_app/src/presentation/screen/home/brain_storm.dart';
import 'package:diary_app/src/presentation/screen/home/calendar_screen.dart';
import 'package:diary_app/src/presentation/screen/home/home_screen.dart';
import 'package:diary_app/src/presentation/screen/home/profile_screen.dart';
import 'package:diary_app/src/presentation/screen/home/widget/add_gallery_button.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

import 'widget/add_diary_button.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int currentIndex = 0;

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const BrainStormScreen();
      case 2:
        return const CalendarScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: secondaryColor,
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 338,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 6,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                      SizedBox(height: defaultMargin),
                      CostumText(
                        text: "Ada cerita apa hari ini",
                        color: blackColor,
                        fontSize: 18,
                      ),
                      SizedBox(height: 20),
                      const AddDiaryButton(),
                      const SizedBox(height: 20),
                      const AddGalleryButton()
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add, size: 36),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: secondaryColor,
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/icon_home.png',
                    color: currentIndex == 0 ? blackColor : primaryColor,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/icon_chat.png',
                      color: currentIndex == 1 ? blackColor : primaryColor),
                ),
                label: 'Brain Storm'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/icon_calendar.png',
                      color: currentIndex == 2 ? blackColor : primaryColor),
                ),
                label: 'Calendar'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/icon_profile.png',
                      color: currentIndex == 3 ? blackColor : primaryColor),
                ),
                label: 'Profile'),
          ]),
      body: body(),
    );
  }
}
