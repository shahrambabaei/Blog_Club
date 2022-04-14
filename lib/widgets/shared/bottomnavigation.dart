import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

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
                    color: 
                    const Color(0xff9b8487).withOpacity(0.5),
                    offset:const Offset(0, -5)
                  )
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildItem(iconFileName: 'Home.png', text: 'Home'),
                    buildItem(iconFileName: 'Articles.png', text: 'Articles'),
                    const SizedBox(
                      width: 42,
                    ),
                    buildItem(iconFileName: 'Search.png', text: 'Search'),
                    buildItem(iconFileName: 'Menu.png', text: 'Menu'),
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

  Widget buildItem({required String iconFileName, required String text}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/icons/$iconFileName"),
          const SizedBox(
            height: 4,
          ),
          Text(text,
              style: const TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7B8BB2)))
        ],
      );
}
