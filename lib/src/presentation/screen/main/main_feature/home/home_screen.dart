import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/src/core/provider/diary_provider.dart';
import 'package:diary_app/src/core/provider/states/home_nav/home_notifier.dart';
import 'package:diary_app/src/core/repository/user_repository.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/home/mood_bar.dart';
import 'package:diary_app/src/presentation/screen/diary/my_diary_page.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/home/to_do_list_page.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/home/weather_indicator.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/home/widget/my_diary_navigation.dart';
import 'package:diary_app/src/presentation/screen/main/main_feature/home/widget/to_do_list_navigation.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // final UserDatasource user = UserDatasource().userData;

  @override
  Widget build(BuildContext context) {
    // final diaryAsync = ref.watch(diaryProvider);
    final user = FirebaseAuth.instance.currentUser!;
    var currentIndex = ref.watch(homeNavProvider).index;

    final List<Widget> _mainContent = <Widget>[
      const MyDiary(),
      const ToDoList()
    ];

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 87,
        backgroundColor: primaryColor,
        title: CostumText(
          text: "Hello, ${user.displayName}",
          color: whiteColor,
          fontWeight: light,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WeatherIndicator(),

                const SizedBox(height: 40),
                // Emoji button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: const MoodBar(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _mainContent[currentIndex],
                Container(
                  height: 50,
                  width: double.infinity,
                  color: secondaryColor,
                ),
                Positioned(
                  top: -29,
                  right: 0,
                  left: 0,
                  child: Row(
                    children: <Widget>[
                      MyDiaryNavigation(ref: ref, currentIndex: currentIndex),
                      ToDoListNavigation(ref: ref, currentIndex: currentIndex),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
