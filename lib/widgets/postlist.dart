import 'package:blog_club/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 16, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('More',
                    style: TextStyle(
                      color: Color(0xff376AED),
                    )),
                style: const ButtonStyle(enableFeedback: false),
              )
            ],
          ),
        ),
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: posts.length,
          itemExtent: 141,
          shrinkWrap: true,
          itemBuilder: (context, index) => itemList(context, posts[index]),
        )
      ],
    );
  }

  Widget itemList(BuildContext context, Post post) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Color(0x1a5282FF), blurRadius: 10)
            ]),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/posts/small/${post.imageFileName}",
                    fit: BoxFit.fitHeight,
                    height: double.infinity,
                  ))),
          Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.caption,
                      style: const TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff376AED)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(post.title,
                        style: Theme.of(context).textTheme.subtitle2),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.thumb_up_alt_outlined,
                            size: 16,
                            color:
                                Theme.of(context).textTheme.bodyText2!.color),
                        Text(post.likes,
                            style: Theme.of(context).textTheme.bodyText2),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(CupertinoIcons.clock,
                            size: 16,
                            color:
                                Theme.of(context).textTheme.bodyText2!.color),
                        Text(post.time,
                            style: Theme.of(context).textTheme.bodyText2),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                              post.isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              size: 20,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color),
                        ))
                      ],
                    ),
                  ],
                ),
              ))
        ]),
      );
}
