import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _page = 0;
  late ThemeData _themeData;
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != _page) {
        setState(() {
          _page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _themeData = Theme.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: _themeData.colorScheme.background,
      body: Column(children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 5),
              child: Assets.images.background.onboarding.image()),
        ),
        Container(
          height: 285,
          decoration: BoxDecoration(
              color: _themeData.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey)]),
          child: Column(children: [
            Expanded(child: buildPageView()),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
              child: SizedBox(
                height: 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          controller: _pageController,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              expansionFactor: 2.5,
                              activeDotColor: _themeData.colorScheme.primary,
                              dotColor: _themeData.colorScheme.primary
                                  .withOpacity(.3))),
                      ElevatedButton(
                        onPressed: () {
                          if (_page == items.length - 1) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                          } else {
                            _pageController.animateToPage(_page + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          }
                        },
                        child: Icon(
                          _page == items.length - 1 ? Icons.check : Icons.east,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(84, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      )
                    ]),
              ),
            )
          ]),
        )
      ]),
    ));
  }

  //~craete Pageview
  Widget buildPageView() => PageView.builder(
        itemCount: items.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(items[index].title, style: _themeData.textTheme.headline4),
              const SizedBox(
                height: 16,
              ),
              Text(
                items[index].description,
                style:
                    _themeData.textTheme.subtitle1!.apply(fontSizeFactor: .8),
              )
            ]),
          );
        },
      );
}
