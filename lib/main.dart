import 'package:blog_club/pages/homepage.dart';
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
    const Color primaryTextColor = Color(0xff0D253C);
    const Color secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              caption: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7B8BB2),
                  fontSize: 10),
              subtitle1: TextStyle(
                  color: secondaryTextColor,
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
              headline6: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                  fontFamily: defaultFontFamily),
              headline4: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: primaryTextColor),
              headline5: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor),
              bodyText2: TextStyle(
                  fontFamily: defaultFontFamily,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w500))),
      home: const HomePage(),
    );
  }
}
