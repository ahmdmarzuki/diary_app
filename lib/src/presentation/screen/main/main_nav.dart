import 'package:diary_app/src/presentation/provider/states/main_nav/main_nav_notifier.dart';
import 'package:diary_app/src/presentation/screen/diary/widget/add_diary_button.dart';
import 'package:diary_app/src/presentation/screen/diary/widget/add_gallery_button.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/brain_storm/brain_storm.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/calendar/calendar_screen.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/home/home_screen.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/profile/profile_screen.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainNav extends ConsumerStatefulWidget {
  const MainNav({super.key});

  @override
  ConsumerState<MainNav> createState() => _MainNavState();
}

class _MainNavState extends ConsumerState<MainNav> {
  // list item dalam nav bar
  static final List<Widget> _widgetOption = <Widget>[
    const HomeScreen(),
    const BrainStormScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // ngambil data dari navProvider
    var navIndex = ref.watch(mainNavProvider).index;

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
                      const SizedBox(height: 20),
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
          currentIndex: navIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          onTap: (value) {
            ref.read(mainNavProvider.notifier).onIndexChanged(value);
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: secondaryColor,
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/icon_home.png',
                    color: navIndex == 0 ? blackColor : primaryColor,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/icon_chat.png',
                      color: navIndex == 1 ? blackColor : primaryColor),
                ),
                label: 'Brain Storm'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/icon_calendar.png',
                      color: navIndex == 2 ? blackColor : primaryColor),
                ),
                label: 'Calendar'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/icon_profile.png',
                      color: navIndex == 3 ? blackColor : primaryColor),
                ),
                label: 'Profile'),
          ]),
      body: _widgetOption[navIndex],
    );
  }
}
