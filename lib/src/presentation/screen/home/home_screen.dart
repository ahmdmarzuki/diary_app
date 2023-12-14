import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

import 'widget/diary_card.dart';
import 'widget/my_diary_page.dart';
import 'widget/to_do_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;
  // final UserDatasource user = UserDatasource().userData;

  @override
  Widget build(BuildContext context) {
    Widget myDiaryNav() {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              int currentIndex = 0;
              navIndex = currentIndex;
            });
          },
          child: Container(
            height: 58,
            decoration: BoxDecoration(
                color: navIndex == 0 ? secondaryColor : primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(34),
                    topRight: const Radius.circular(34),
                    bottomRight: Radius.circular(navIndex == 0 ? 0 : 34))),
            child: Center(
              child: CostumText(
                text: "My Diary",
                color: navIndex == 0 ? blackColor : whiteColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }

    Widget toDoListNav() {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              int currentIndex = 1;
              navIndex = currentIndex;
            });
          },
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              color: navIndex == 0 ? primaryColor : secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(34),
                topRight: const Radius.circular(34),
                bottomLeft: Radius.circular(navIndex == 1 ? 0 : 34),
              ),
            ),
            child: Center(
              child: CostumText(
                text: "ToDo List",
                color: navIndex == 1 ? blackColor : whiteColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 87,
        backgroundColor: primaryColor,
        title: CostumText(
          text: "Hello,",
          color: whiteColor,
          fontWeight: light,
        ),
        actions: [
          // CircleAvatar(
          //   child: Image.asset(''),
          // )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset('assets/icon_rain.png'),
                    ),
                    SizedBox(width: 20),
                    CostumText(
                      text: "25",
                      color: secondaryColor,
                      fontSize: 28,
                    ),
                    SizedBox(width: 8),
                    CostumText(
                      text: "°",
                      color: secondaryColor,
                      fontSize: 28,
                    ),
                    SizedBox(width: 8),
                    CostumText(
                      text: "C",
                      color: secondaryColor,
                      fontSize: 28,
                    ),
                  ],
                ),

                SizedBox(height: 40),
                // Emoji button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: primaryDarkColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset('assets/icon_sad.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: primaryDarkColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset('assets/icon_neutral.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: primaryDarkColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset('assets/icon_happy.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: primaryDarkColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset('assets/icon_laugh.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                navIndex == 0 ? const MyDiary() : const ToDoList(),
                Positioned(
                  top: -29,
                  right: 0,
                  left: 0,
                  child: Row(
                    children: <Widget>[
                      myDiaryNav(),
                      toDoListNav(),
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
