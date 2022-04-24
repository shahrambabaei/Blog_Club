import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: _themeData.colorScheme.surface,
            body: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    AppBar(
                      title: const Text('Article'),
                      titleSpacing: 32,
                      elevation: 0,
                      backgroundColor: _themeData.colorScheme.surface,
                      foregroundColor: _themeData.colorScheme.onSurface,
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
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        'Four Things Every Woman Needs To Know',
                        style: _themeData.textTheme.headline4!
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 16, 30),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.images.stories.story9
                                  .image(width: 50, height: 50)),
                          const SizedBox(
                            width: 13,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Emilia Clarck',
                                  style: _themeData.textTheme.headline5!
                                      .apply(fontSizeFactor: .8),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text('2m ago')
                              ],
                            ),
                          ),
                          IconButton(
                              splashRadius: 20,
                              onPressed: () {},
                              icon: const Icon(Icons.share)),
                          IconButton(
                              splashRadius: 20,
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border))
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: Assets.images.background.singlePost.image(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                        'A man’s sexuality is never your mind responsibility.',
                        style: _themeData.textTheme.headline5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 50),
                      child: Text(
                        'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                      ),
                    )
                  ]),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            _themeData.colorScheme.surface.withOpacity(0),
                            _themeData.colorScheme.surface,
                          ])),
                    ))
              ],
            ),
            floatingActionButton: InkWell(
                onTap: () {
                  showSnackBar(context, 'Click FloatingActionButton!!!');
                },
                child: Container(
                  width: 111,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color:
                                _themeData.colorScheme.primary.withOpacity(0.5))
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.background.thumbs.svg(),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '2.1K',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: _themeData.colorScheme.onPrimary),
                        )
                      ]),
                ))));
  }

//create SnackBar
  void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.fixed,
      ));
}
