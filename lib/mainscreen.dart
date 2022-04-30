import 'package:blog_club/screens/articlescreen.dart';
import 'package:blog_club/screens/homeScreen.dart';
import 'package:blog_club/screens/profilescreen.dart';
import 'package:blog_club/screens/searchscreen.dart';
import 'package:flutter/material.dart';

const int homeIndex = 0;
const int articleIndex = 1;
const int seerchIndex = 2;
const int profileIndex = 3;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          bottom: 70,
          child: IndexedStack(index: selectedTabIndex, children: const [
            HomeScreen(),
            ArticleScreen(),
            SearchScreen(),
            ProfileScreen()
          ]),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomNavigation(
                selected: selectedTabIndex,
                onTap: (int index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                }))
      ],
    ));
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation(
      {Key? key, required this.onTap, required this.selected})
      : super(key: key);
  final void Function(int index) onTap;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 70,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: const Color(0xff9b8487).withOpacity(0.5),
                      offset: const Offset(0, -5))
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildBottomNavigationItem(
                        iconFileName: 'Home.png',
                        activeIconFileName: 'HomeActive.png',
                        title: 'Home',
                        onTap: () {
                          onTap(homeIndex);
                        },
                        isActive: selected == homeIndex),
                    buildBottomNavigationItem(
                        iconFileName: 'Articles.png',
                        activeIconFileName: 'ArticlesActive.png',
                        title: 'Articles',
                        onTap: () {
                          onTap(articleIndex);
                        },
                        isActive: selected == articleIndex),
                    Container(width: 60),
                    buildBottomNavigationItem(
                        iconFileName: 'Search.png',
                        activeIconFileName: 'SearchActive.png',
                        title: 'Search',
                        onTap: () {
                          onTap(seerchIndex);
                        },
                        isActive: selected == seerchIndex),
                    buildBottomNavigationItem(
                        iconFileName: 'Menu.png',
                        activeIconFileName: 'MenuActive.png',
                        title: 'Menu',
                        onTap: () {
                          onTap(profileIndex);
                        },
                        isActive: selected == profileIndex),
                  ],
                ),
              )),
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  color: const Color(0xff376AED),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                  radius: 30,
                  child: Image.asset("assets/images/icons/plus.png")),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBottomNavigationItem(
          {required String iconFileName,
          required String activeIconFileName,
          required String title,
          required Function() onTap,
          required bool isActive}) =>
      Expanded(
        child: InkWell(
          enableFeedback: false,
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icons/${isActive ? activeIconFileName : iconFileName}",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(title,
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w700,
                        color: Color(isActive ? 0xff376AED : 0xff7B8BB2)))
              ],
            )),
      );
}
