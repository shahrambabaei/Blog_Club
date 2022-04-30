import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/widgets/postlist.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData themeData;
  @override
  void didChangeDependencies() {
    themeData = Theme.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: themeData.colorScheme.background,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                AppBar(
                  backgroundColor: themeData.colorScheme.background,
                  foregroundColor: themeData.colorScheme.onBackground,
                  title: const Text('Profile'),
                  titleSpacing: 32,
                  elevation: 0,
                  actions: [
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz)),
                    const SizedBox(
                      width: 16,
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(32, 10, 32, 64),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: themeData.colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: themeData.colorScheme.onBackground
                                    .withOpacity(.2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Assets.images.stories.story8
                                          .image(width: 80, height: 80)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text('@joviedan',
                                          style: themeData.textTheme.bodyText2!
                                              .copyWith(fontSize: 15)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('Jovi Daniel',
                                          style: themeData.textTheme.bodyText1!
                                              .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15)),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text('UX Designer',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .apply(
                                                  color: themeData
                                                      .colorScheme.primary))
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 8),
                                child: Text(
                                  'About me',
                                  style: themeData.textTheme.headline6,
                                ),
                              ),
                              Text(
                                'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w200),
                              )
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: 32,
                      left: 94,
                      right: 94,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 25,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(.8))
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 32,
                      left: 64,
                      right: 64,
                      child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: themeData.colorScheme.primary),
                        child: Row(children: [
                          Expanded(flex: 1, child: showItem('52', 'Posts')),
                          Expanded(
                              flex: 1, child: showItem('250', 'Following')),
                          Expanded(
                              flex: 1, child: showItem('4.5K', 'Followers')),
                        ]),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(.2))
                      ]),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 16, 8),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'My Posts',
                            style: themeData.textTheme.headline6,
                          )),
                          IconButton(
                              onPressed: () {},
                              icon: Assets.images.icons.grid.svg()),
                          IconButton(
                              onPressed: () {},
                              icon: Assets.images.icons.table.svg())
                        ],
                      ),
                    ),
                    const PostList()
                  ]),
                ),
              ]),
            )));
  }

//Create InformationPost
  Widget showItem(String number, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(number,
            style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 5,
        ),
        Text(text,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400))
      ],
    );
  }
}
