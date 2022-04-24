import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/pages/articlescreen.dart';
import 'package:blog_club/pages/authpage.dart';
import 'package:blog_club/pages/homepage.dart';
import 'package:blog_club/pages/splashpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff376AED);
    const Color primaryTextColor = Color(0xff0D253C);
    const Color secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              background: Color(0xffFBFCFF),
              surface: Colors.white,
              onBackground: primaryTextColor),
          textTheme: const TextTheme(
              caption: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7B8BB2),
                  fontSize: 10),
              subtitle1: TextStyle(
                  color: secondaryTextColor,
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
              headline6: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                  fontFamily: FontFamily.avenir),
              headline4: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: primaryTextColor),
              headline5: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor),
              bodyText2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 16,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w500))),
      home: const ArticleScreen(),
    );
  }
}
