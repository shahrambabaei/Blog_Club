import 'package:blog_club/widgets/categorylist.dart';
import 'package:blog_club/widgets/postlist.dart';
import 'package:blog_club/widgets/storylist.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 16, 30, 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Hi, Jonathan!',
              style: _themeData.textTheme.subtitle1,
            ),
            Image.asset(
              "assets/images/icons/notification.png",
              scale: 4,
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: Text('Explore todays', style: _themeData.textTheme.headline4),
        ),
        const StoryList(),
        Container(
            margin: const EdgeInsets.only(top: 25),
            child: const CategoryList()),
        PostList()
      ]),
    )));
  }
}
