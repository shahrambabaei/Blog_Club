import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 30),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryItem(story: stories[index]);
        },
      ),
    );
  }
}

// create Story
class StoryItem extends StatelessWidget {
  const StoryItem({required this.story, Key? key}) : super(key: key);
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                story.isViewed ? _profileImageView() : _profileImageNormal(),
                Positioned(
                    bottom: -4,
                    right: -4,
                    child: Image.asset(
                      "assets/images/icons/${story.iconFileName}",
                      scale: 1.5,
                    ))
              ],
            ),
            Text(story.name)
          ],
        ));
  }

  Widget _profileImageNormal() {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff376AED),
              Color(0xff49B0E2),
              Color(0xff9CECFB),
            ]),
      ),
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22)),
          child: _profileImage()),
    );
  }

  Widget _profileImageView() {
    return SizedBox(
      width: 70,
      height: 70,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        dashPattern: const [8, 2],
        color: const Color(0xff7B8BB2),
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(3),
        child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(21)),
            child: _profileImage()),
      ),
    );
  }

//create imageStory
  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset("assets/images/stories/${story.imageFileName}"),
    );
  }
}
