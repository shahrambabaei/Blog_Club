import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/pages/homepage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Future<void> initState() async =>
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Positioned.fill(
            child: Assets.images.background.splash.image(fit: BoxFit.cover)),
        Center(child: Assets.images.icons.logo.svg())
      ]),
    ));
  }
}
