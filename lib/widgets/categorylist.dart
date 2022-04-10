import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) => categoeyItem(
            context: context,
            category: categories[realIndex],
            left: realIndex == 0 ? 30 : 7,
            right: realIndex == categories.length - 1 ? 30 : 7),
        options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            initialPage: 0,
            aspectRatio: 1.25,
            viewportFraction: .72,
            enableInfiniteScroll: false,
            disableCenter: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height));
  }

  Widget categoeyItem({
    required BuildContext context,
    required Category category,
    required double left,
    required double right,
  }) {
    return Container(
        margin: EdgeInsets.only(left: left, right: right),
        child: Stack(
          children: [
            Positioned.fill(
                top: 100,
                left: 56,
                right: 56,
                child: Container(
                    decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
                  ],
                ))),
            Positioned.fill(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Color(0xff0D253C),
                            ])),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        "assets/images/posts/large/${category.imageFileName}",
                        fit: BoxFit.cover,
                      ),
                    ))),
            Positioned(
                bottom: 46,
                left: 30,
                child: Text(category.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .apply(color: Colors.white)))
          ],
        ));
  }
}
